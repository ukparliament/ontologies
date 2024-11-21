#!/usr/bin/env ruby
require 'rdf'
require 'rdf/turtle'
require 'rdf/vocab'  # Ensure we have access to RDF vocabularies
require 'open-uri'
require 'erb'
require 'time'       # Require the time library to format the timestamp

# Default ontology URL
DEFAULT_ONTOLOGY_URL = 'https://ukparliament.github.io/ontologies/election/election-ontology.ttl'

# Get the input URL from command-line arguments or use the default
input_url = ARGV[0] || DEFAULT_ONTOLOGY_URL

# Record the current time for the 'Page last generated' timestamp
generation_time = Time.now

# Load the ontology from the URL
begin
  puts "Loading ontology from: #{input_url}"
  ttl_content = URI.open(input_url).read
  reader = RDF::Turtle::Reader.new(ttl_content, base_uri: input_url)
  graph = RDF::Graph.new
  graph << reader
rescue OpenURI::HTTPError => e
  puts "Failed to load the ontology file from the URL: #{e.message}"
  exit
rescue StandardError => e
  puts "An error occurred: #{e.message}"
  exit
end

# Extract prefixes from the reader
prefixes = reader.prefixes

# Extract ontology URI
ontology_uri = graph.subjects.detect { |s| s.to_s.end_with?('#') || s.to_s.end_with?('/') } || graph.first_subject

# Extract metadata
ontology_title_literal = graph.query([ontology_uri, RDF::RDFS.label, nil]).map(&:object).find { |l| l.language == :en } ||
                         graph.query([ontology_uri, RDF::RDFS.label, nil]).map(&:object).find { |l| l.language.nil? }

ontology_title = ontology_title_literal ? ontology_title_literal.to_s : "Ontology Documentation"

ontology_type = graph.query([ontology_uri, RDF.type, nil]).map(&:object).map(&:to_s).join(', ')

ontology_created = (graph.query([ontology_uri, RDF::Vocab::DC.created, nil]).first&.object || "").to_s

ontology_rights = (graph.query([ontology_uri, RDF::Vocab::DC.rights, nil]).first&.object || "").to_s

ontology_description = (graph.query([ontology_uri, RDF::Vocab::DC.description, nil]).first&.object || "").to_s

ontology_depiction = (graph.query([ontology_uri, RDF::Vocab::FOAF.depiction, nil]).first&.object || "").to_s

# Extract creators (makers)
makers = []
[RDF::Vocab::DC.creator, RDF::Vocab::FOAF.maker].each do |predicate|
  graph.query([ontology_uri, predicate, nil]).each do |statement|
    maker = statement.object
    name_literal = graph.query([maker, RDF::Vocab::FOAF.name, nil]).map(&:object).find { |l| l.language == :en } ||
                   graph.query([maker, RDF::Vocab::FOAF.name, nil]).map(&:object).find { |l| l.language.nil? }

    name = name_literal ? name_literal.to_s : ""
    homepage = (graph.query([maker, RDF::Vocab::FOAF.homepage, nil]).first&.object || "").to_s
    makers << { uri: maker, name: name, homepage: homepage }
  end
end

# Extract classes, properties, and individuals
classes = []
object_properties = []
data_properties = []
annotation_properties = []
individuals = []

graph.query([nil, RDF.type, nil]).each do |statement|
  subject = statement.subject
  type = statement.object

  case type
  when RDF::Vocab::OWL.Class, RDF::RDFS.Class
    classes << subject
  when RDF::Vocab::OWL.ObjectProperty
    object_properties << subject
  when RDF::Vocab::OWL.DatatypeProperty
    data_properties << subject
  when RDF::Vocab::OWL.AnnotationProperty
    annotation_properties << subject
  when RDF::Vocab::OWL.NamedIndividual
    individuals << subject
  end
end

# Remove duplicates
classes.uniq!
object_properties.uniq!
data_properties.uniq!
annotation_properties.uniq!
individuals.uniq!

# Function to get label for a resource, using only rdfs:label
def get_label(resource, graph, preferred_language = :en)
  labels = graph.query([resource, RDF::RDFS.label, nil]).map(&:object)
  label_literal = labels.find { |l| l.language == preferred_language } ||
                  labels.find { |l| l.language.nil? }
  label = label_literal ? label_literal.to_s : nil
  label
end

# Function to generate a sanitized ID for HTML
def generate_id(label)
  if label && !label.empty?
    label.downcase.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
  else
    nil
  end
end

# Function to generate a filename based on the source URL pattern
def filename_from_source_url(input_url, default_title)
  uri = URI(input_url)
  base = File.basename(uri.path)

  if base.end_with?('.ttl')
    filename = base.sub('.ttl', '.html')
  else
    # Fallback to using the default title
    filename = default_title.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
    filename = filename.empty? ? "ontology.html" : "#{filename}.html"
  end

  filename
end

# Sort classes alphabetically by label
classes.sort_by! { |cls| get_label(cls, graph)&.downcase || '' }

# Prepare class details
class_details = classes.map do |cls|
  # Get class label
  class_label = get_label(cls, graph)

  # Skip if label is nil
  next unless class_label

  # Get class comment (description)
  class_comment_literal = graph.query([cls, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                          graph.query([cls, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
  class_comment = class_comment_literal ? class_comment_literal.to_s : ""

  # Get class ID
  class_id = generate_id(class_label)

  # Get subclasses (classes where cls is their superclass)
  subclasses = graph.query([nil, RDF::RDFS.subClassOf, cls]).map(&:subject).uniq

  # Get labels and IDs for subclasses
  subclass_details = subclasses.map do |sub|
    label = get_label(sub, graph)
    next unless label
    id = generate_id(label)
    { uri: sub, label: label, id: id }
  end.compact

  # Sort subclasses by label
  subclass_details.sort_by! { |sub| sub[:label].downcase }

  # Get properties where cls is the domain
  properties_with_domain = graph.query([nil, RDF::RDFS.domain, cls]).map(&:subject).uniq

  # Get properties where cls is the range
  properties_with_range = graph.query([nil, RDF::RDFS.range, cls]).map(&:subject).uniq

  # Get labels and IDs for properties with cls as domain
  properties_details = properties_with_domain.map do |prop|
    label = get_label(prop, graph)
    next unless label
    id = generate_id(label)
    { id: id, label: label }
  end.compact

  # Sort properties by label
  properties_details.sort_by! { |prop| prop[:label].downcase }

  # Get labels and IDs for properties with cls as range
  properties_in_range_details = properties_with_range.map do |prop|
    label = get_label(prop, graph)
    next unless label
    id = generate_id(label)
    { id: id, label: label }
  end.compact

  # Sort properties in range by label
  properties_in_range_details.sort_by! { |prop| prop[:label].downcase }

  {
    uri: cls,
    label: class_label,
    id: class_id,
    comment: class_comment,
    subclasses: subclass_details,
    properties: properties_details,
    properties_in_range: properties_in_range_details
  }
end.compact

# Create a hash for quick ID lookup of classes
class_ids = class_details.map { |cls| [cls[:uri], cls[:id]] }.to_h

# Sort object properties alphabetically by label
object_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

# Prepare object property details
object_property_details = object_properties.map do |prop|
  object_property_label = get_label(prop, graph)
  next unless object_property_label
  object_property_id = generate_id(object_property_label)
  comment_literal = graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
  comment = comment_literal ? comment_literal.to_s : ""

  # Get domains
  domains = graph.query([prop, RDF::RDFS.domain, nil]).map(&:object).uniq

  # Get ranges
  ranges = graph.query([prop, RDF::RDFS.range, nil]).map(&:object).uniq

  # Prepare domain details
  domain_details = domains.map do |domain|
    label = get_label(domain, graph)
    next unless label
    id = class_ids[domain] || generate_id(label)
    { id: id, label: label }
  end.compact

  # Prepare range details
  range_details = ranges.map do |range|
    label = get_label(range, graph)
    next unless label
    id = class_ids[range] || generate_id(label)
    { id: id, label: label }
  end.compact

  {
    uri: prop,
    label: object_property_label,
    id: object_property_id,
    comment: comment,
    domains: domain_details,
    ranges: range_details
  }
end.compact

# Create a hash for quick ID lookup of object properties
object_property_ids = object_property_details.map { |prop| [prop[:uri], prop[:id]] }.to_h

# Sort data properties alphabetically by label
data_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

# Prepare data property details
data_property_details = data_properties.map do |prop|
  datatype_property_label = get_label(prop, graph)
  next unless datatype_property_label
  datatype_property_id = generate_id(datatype_property_label)
  comment_literal = graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
  comment = comment_literal ? comment_literal.to_s : ""

  # Get domains
  domains = graph.query([prop, RDF::RDFS.domain, nil]).map(&:object).uniq

  # Get ranges
  ranges = graph.query([prop, RDF::RDFS.range, nil]).map(&:object).uniq

  # Prepare domain details
  domain_details = domains.map do |domain|
    label = get_label(domain, graph)
    next unless label
    id = class_ids[domain] || generate_id(label)
    { id: id, label: label }
  end.compact

  # Prepare range details
  range_details = ranges.map do |range|
    label = get_label(range, graph)
    next unless label
    id = class_ids[range] || generate_id(label)
    { id: id, label: label }
  end.compact

  {
    uri: prop,
    label: datatype_property_label,
    id: datatype_property_id,
    comment: comment,
    domains: domain_details,
    ranges: range_details
  }
end.compact

# Create a hash for quick ID lookup of data properties
data_property_ids = data_property_details.map { |prop| [prop[:uri], prop[:id]] }.to_h

# Sort annotation properties alphabetically by label
annotation_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

# Prepare annotation property details
annotation_property_details = annotation_properties.map do |prop|
  label = get_label(prop, graph)
  next unless label
  id = generate_id(label)
  comment_literal = graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
  comment = comment_literal ? comment_literal.to_s : ""

  {
    uri: prop,
    label: label,
    id: id,
    comment: comment
  }
end.compact

# Sort individuals alphabetically by label
individuals.sort_by! { |ind| get_label(ind, graph)&.downcase || '' }

# Prepare individual details
individual_details = individuals.map do |ind|
  label = get_label(ind, graph)
  next unless label
  id = generate_id(label)
  comment_literal = graph.query([ind, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([ind, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
  comment = comment_literal ? comment_literal.to_s : ""

  {
    uri: ind,
    label: label,
    id: id,
    comment: comment
  }
end.compact

# Define the ERB template for the HTML output
template = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= ontology_title %></title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<body>

  <header>
    <h1><%= ontology_title %></h1>
    <% if ontology_type && !ontology_type.empty? %>
      <p><strong>Type:</strong> <%= ontology_type %></p>
    <% end %>
    <% if ontology_created && !ontology_created.empty? %>
      <p><strong>Created:</strong> <%= ontology_created %></p>
    <% end %>
    <% if ontology_rights && !ontology_rights.empty? %>
      <p><strong>Rights:</strong> <%= ontology_rights %></p>
    <% end %>
    <% if ontology_description && !ontology_description.empty? %>
      <p><strong>Description:</strong> <%= ontology_description %></p>
    <% end %>
    <% if ontology_depiction && !ontology_depiction.empty? %>
      <p><strong>Depiction:</strong> <a href="<%= ontology_depiction %>"><%= ontology_depiction %></a></p>
    <% end %>
    <% if makers.any? %>
      <p><strong>Creators:</strong></p>
      <ul>
        <% makers.each do |maker| %>
          <li>
            <% if !maker[:name].empty? %>
              <%= maker[:name] %>
            <% else %>
              <%= maker[:uri] %>
            <% end %>
            <% if !maker[:homepage].empty? %>
              (<a href="<%= maker[:homepage] %>">Homepage</a>)
            <% end %>
          </li>
        <% end %>
      </ul>
    <% end %>
    <% if input_url %>
      <p><strong>Source TTL:</strong> <a href="<%= input_url %>"><%= input_url %></a></p>
    <% end %>
    <!-- Add navigation links -->
    <nav>
      <ul>
        <% if class_details.any? %>
          <li><a href="#classes">Classes</a></li>
        <% end %>
        <% if object_property_details.any? %>
          <li><a href="#object-properties">Object Properties</a></li>
        <% end %>
        <% if data_property_details.any? %>
          <li><a href="#datatype-properties">Datatype Properties</a></li>
        <% end %>
        <% if annotation_property_details.any? %>
          <li><a href="#annotation-properties">Annotation Properties</a></li>
        <% end %>
        <% if individual_details.any? %>
          <li><a href="#individuals">Individuals</a></li>
        <% end %>
      </ul>
    </nav>
  </header>

  <% if class_details.any? %>
  <section id="classes">
    <h2>Classes</h2>
    <% class_details.each do |cls| %>
      <div class="entity">
        <% if cls[:id] %>
          <h3 id="<%= cls[:id] %>"><%= cls[:label] %> &mdash; class</h3>
        <% else %>
          <h3><%= cls[:label] %></h3>
        <% end %>
        <% if !cls[:comment].empty? %>
          <p><%= cls[:comment] %></p>
        <% end %>
        <% if cls[:subclasses].any? %>
          <p><strong>Subclasses:</strong></p>
          <ul>
            <% cls[:subclasses].each do |sub| %>
              <li>
                <% if sub[:id] %>
                  <a href="#<%= sub[:id] %>"><%= sub[:label] %></a>
                <% else %>
                  <%= sub[:label] %>
                <% end %>
              </li>
            <% end %>
          </ul>
        <% end %>
        <% if cls[:properties].any? %>
          <p><strong>Properties with this class as domain:</strong></p>
          <ul>
            <% cls[:properties].each do |prop| %>
              <li>
                <% if prop[:id] %>
                  <a href="#<%= prop[:id] %>"><%= prop[:label] %></a>
                <% else %>
                  <%= prop[:label] %>
                <% end %>
              </li>
            <% end %>
          </ul>
        <% end %>
        <% if cls[:properties_in_range].any? %>
          <p><strong>Properties where this class is in range of:</strong></p>
          <ul>
            <% cls[:properties_in_range].each do |prop| %>
              <li>
                <% if prop[:id] %>
                  <a href="#<%= prop[:id] %>"><%= prop[:label] %></a>
                <% else %>
                  <%= prop[:label] %>
                <% end %>
              </li>
            <% end %>
          </ul>
        <% end %>
      </div>
    <% end %>
  </section>
  <% end %>

  <% if object_property_details.any? %>
  <section id="object-properties">
    <h2>Object Properties</h2>
    <% object_property_details.each do |prop| %>
      <div class="entity">
        <% if prop[:id] %>
          <h3 id="<%= prop[:id] %>"><%= prop[:label] %> &mdash; object property</h3>
        <% else %>
          <h3><%= prop[:label] %></h3>
        <% end %>
        <% if !prop[:comment].empty? %>
          <p><%= prop[:comment] %></p>
        <% end %>
        <% if prop[:domains].any? %>
          <p><strong>Domain:</strong>
            <% prop[:domains].each_with_index do |domain, index| %>
              <% if domain[:id] %>
                <a href="#<%= domain[:id] %>"><%= domain[:label] %></a><%= ',' if index < prop[:domains].size - 1 %>
              <% else %>
                <%= domain[:label] %><%= ',' if index < prop[:domains].size - 1 %>
              <% end %>
            <% end %>
          </p>
        <% end %>
        <% if prop[:ranges].any? %>
          <p><strong>Range:</strong>
            <% prop[:ranges].each_with_index do |range, index| %>
              <% if range[:id] %>
                <a href="#<%= range[:id] %>"><%= range[:label] %></a><%= ',' if index < prop[:ranges].size - 1 %>
              <% else %>
                <%= range[:label] %><%= ',' if index < prop[:ranges].size - 1 %>
              <% end %>
            <% end %>
          </p>
        <% end %>
      </div>
    <% end %>
  </section>
  <% end %>

  <% if data_property_details.any? %>
  <section id="datatype-properties">
    <h2>Datatype Properties</h2>
    <% data_property_details.each do |prop| %>
      <div class="entity">
        <% if prop[:id] %>
          <h3 id="<%= prop[:id] %>"><%= prop[:label] %> &mdash; data type</h3>
        <% else %>
          <h3><%= prop[:label] %></h3>
        <% end %>
        <% if !prop[:comment].empty? %>
          <p><%= prop[:comment] %></p>
        <% end %>
        <% if prop[:domains].any? %>
          <p><strong>Domain:</strong>
            <% prop[:domains].each_with_index do |domain, index| %>
              <% if domain[:id] %>
                <a href="#<%= domain[:id] %>"><%= domain[:label] %></a><%= ',' if index < prop[:domains].size - 1 %>
              <% else %>
                <%= domain[:label] %><%= ',' if index < prop[:domains].size - 1 %>
              <% end %>
            <% end %>
          </p>
        <% end %>
        <% if prop[:ranges].any? %>
          <p><strong>Range:</strong>
            <% prop[:ranges].each_with_index do |range, index| %>
              <% if range[:id] %>
                <a href="#<%= range[:id] %>"><%= range[:label] %></a><%= ',' if index < prop[:ranges].size - 1 %>
              <% else %>
                <%= range[:label] %><%= ',' if index < prop[:ranges].size - 1 %>
              <% end %>
            <% end %>
          </p>
        <% end %>
      </div>
    <% end %>
  </section>
  <% end %>

  <% if annotation_property_details.any? %>
  <section id="annotation-properties">
    <h2>Annotation Properties</h2>
    <% annotation_property_details.each do |prop| %>
      <div class="entity">
        <% if prop[:id] %>
          <h3 id="<%= prop[:id] %>"><%= prop[:label] %></h3>
        <% else %>
          <h3><%= prop[:label] %></h3>
        <% end %>
        <% if !prop[:comment].empty? %>
          <p><%= prop[:comment] %></p>
        <% end %>
      </div>
    <% end %>
  </section>
  <% end %>

  <% if individual_details.any? %>
  <section id="individuals">
    <h2>Individuals</h2>
    <% individual_details.each do |ind| %>
      <div class="entity">
        <% if ind[:id] %>
          <h3 id="<%= ind[:id] %>"><%= ind[:label] %></h3>
        <% else %>
          <h3><%= ind[:label] %></h3>
        <% end %>
        <% if !ind[:comment].empty? %>
          <p><%= ind[:comment] %></p>
        <% end %>
      </div>
    <% end %>
  </section>
  <% end %>

  <footer>
    <h2>Namespaces</h2>
    <ul>
      <% prefixes.each do |prefix, uri| %>
        <li><strong><%= prefix %></strong>: <%= uri %></li>
      <% end %>
    </ul>
    <p>Page last generated: <%= generation_time.strftime("%Y-%m-%d %H:%M:%S %Z") %></p>
  </footer>

</body>
</html>
HTML

# Render the HTML using ERB
renderer = ERB.new(template)
html_output = renderer.result(binding)

# Generate filename based on input URL or ontology title
output_file = filename_from_source_url(input_url, ontology_title)

# Ensure that the generated file overwrites any existing file with the same name
# Remove the existing file if it exists
if File.exist?(output_file)
  File.delete(output_file)
end

# Save the HTML to a file
File.open(output_file, 'w') do |file|
  file.write(html_output)
end

puts "Documentation has been generated and saved to #{output_file}"