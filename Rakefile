# Ontology Documentation Generator
# This Rakefile provides tasks to list TTL files and generate HTML documentation from ontology files.

# List all Turtle (.ttl) files in the project
desc "List all TTL files in the project"
task :list_ttl_files do
  ttl_files = Dir.glob('**/*.ttl')
  ttl_files.each do |file|
    puts file
  end
end

# Generate HTML documentation for all TTL files in the project
desc "Generate documentation from ontology"
task :generate_docs do
  # Required libraries for RDF processing and HTML generation
  require 'rdf'
  require 'rdf/turtle'
  require 'rdf/vocab'
  require 'open-uri'
  require 'erb'
  require 'time'
  require 'fileutils'

  # Create HTML output directory if it doesn't exist
  html_dir = './html'
  FileUtils.mkdir_p(html_dir)
  
  # Delete all files in the HTML directory before generating new documentation
  puts "Cleaning HTML directory..."
  Dir.glob(File.join(html_dir, '*')).each do |file|
    if File.file?(file)
      File.delete(file)
      puts "  Deleted: #{file}"
    end
  end
  
  # Find all TTL files in the project
  ttl_files = Dir.glob('**/*.ttl')
  
  if ttl_files.empty?
    puts "No TTL files found in the project."
  else
    puts "Found #{ttl_files.length} TTL files to process."
    
    processed_count = 0
    skipped_count = 0
    invalid_syntax_count = 0
    
    # Track files with syntax errors
    syntax_errors = []
    
    # Process each TTL file
    ttl_files.each do |ttl_file|
      puts "Processing: #{ttl_file}"
      
      # Check if file has valid TTL syntax
      syntax_valid, error_details = is_valid_ttl?(ttl_file)
      unless syntax_valid
        puts "  Skipping: Invalid TTL syntax"
        invalid_syntax_count += 1
        syntax_errors << error_details
        next
      end
      
      # Check if file contains an OWL ontology before processing
      if contains_owl_ontology?(ttl_file)
        generate_html_for_ttl_file(ttl_file)
        processed_count += 1
      else
        puts "  Skipping: File does not contain an OWL ontology"
        skipped_count += 1
      end
    end
    
    puts "Documentation generation complete."
    puts "Processed: #{processed_count}, Skipped: #{skipped_count}, Invalid syntax: #{invalid_syntax_count}"
    
    # Display summary of files with syntax errors
    if syntax_errors.any?
      puts "\nSyntax Error Summary:"
      puts "=" * 80
      syntax_errors.each do |error|
        puts "File: #{error[:file]}"
        puts "Error type: #{error[:error_type]}"
        puts "Message: #{error[:message]}"
        if error[:line]
          puts "Line: #{error[:line]}, Column: #{error[:column]}"
        end
        if error[:snippet]
          puts "Context:"
          puts "-" * 40
          puts error[:snippet]
          puts "-" * 40
        end
        if error[:backtrace]
          puts "Stack trace:"
          puts error[:backtrace]
        end
        puts "=" * 80
      end
    end
  end
end

# Check if a file contains valid TTL syntax
def is_valid_ttl?(file_path)
  begin
    puts "  Validating TTL syntax..."
    ttl_content = File.read(file_path)
    reader = RDF::Turtle::Reader.new(ttl_content, validate: true)
    
    # Try parsing the entire file to validate syntax
    graph = RDF::Graph.new
    graph << reader
    puts "  TTL syntax is valid"
    return [true, nil]
  rescue RDF::ReaderError => e
    # Extract detailed error information
    error_message = e.message
    line_number = nil
    column_number = nil
    error_snippet = nil
    
    # Try to extract line and column numbers
    if e.message =~ /line\s+(\d+)/i
      line_number = $1.to_i
    end
    
    if e.message =~ /column\s+(\d+)/i
      column_number = $1.to_i
    end
    
    # If we have the line number, try to extract the problematic line and surrounding context
    if line_number && File.exist?(file_path)
      lines = File.readlines(file_path)
      start_line = [line_number - 3, 0].max
      end_line = [line_number + 2, lines.length - 1].min
      
      error_snippet = lines[start_line..end_line].map.with_index do |line, idx|
        line_num = start_line + idx + 1
        prefix = line_num == line_number ? ">> " : "   "
        "#{prefix}#{line_num}: #{line}"
      end.join
    end
    
    puts "  TTL syntax error: #{error_message}"
    
    error_details = {
      file: file_path,
      error_type: "RDF::ReaderError",
      message: error_message,
      line: line_number,
      column: column_number,
      snippet: error_snippet
    }
    
    return [false, error_details]
  rescue StandardError => e
    error_message = e.message
    backtrace = e.backtrace[0..5].join("\n  ")
    
    puts "  Error validating TTL file: #{error_message}"
    
    error_details = {
      file: file_path,
      error_type: e.class.name,
      message: error_message,
      backtrace: backtrace
    }
    
    return [false, error_details]
  end
end

# Check if the file contains an OWL ontology declaration
def contains_owl_ontology?(file_path)
  begin
    ttl_content = File.read(file_path)
    reader = RDF::Turtle::Reader.new(ttl_content)
    graph = RDF::Graph.new
    graph << reader
    
    # Check if any subject has rdf:type owl:Ontology
    has_ontology = graph.query([nil, RDF.type, RDF::Vocab::OWL.Ontology]).any?
    
    if has_ontology
      puts "  File contains an OWL ontology"
      return true
    else
      return false
    end
  rescue StandardError => e
    puts "  Error checking if file contains an ontology: #{e.message}"
    return false
  end
end

# Helper method to generate HTML documentation for a single TTL file
def generate_html_for_ttl_file(file_path)
  # Record the current time for the 'Page last generated' timestamp
  generation_time = Time.now

  begin
    # Load the ontology from the file
    puts "  Loading file: #{file_path}"
    ttl_content = File.read(file_path)
    
    # Use file URL for local files (for proper resolution of relative URIs)
    file_url = "file://" + File.absolute_path(file_path)
    reader = RDF::Turtle::Reader.new(ttl_content, base_uri: file_url)
    
    graph = RDF::Graph.new
    graph << reader

    # Extract prefixes from the reader
    prefixes = reader.prefixes

    # Find the ontology URI by looking for a subject with rdf:type owl:Ontology
    ontology_uri = graph.query([nil, RDF.type, RDF::Vocab::OWL.Ontology]).first&.subject
    
    # Fallback to traditional method if no explicit ontology URI is found
    if ontology_uri.nil?
      ontology_uri = graph.subjects.detect { |s| s.to_s.end_with?('#') || s.to_s.end_with?('/') } || graph.first_subject
    end

    # Extract metadata
    ontology_title_literal = graph.query([ontology_uri, RDF::RDFS.label, nil]).map(&:object).find { |l| l.language == :en } ||
                            graph.query([ontology_uri, RDF::RDFS.label, nil]).map(&:object).find { |l| l.language.nil? }

    # Use filename as fallback if no title is found
    ontology_title = ontology_title_literal ? ontology_title_literal.to_s : File.basename(file_path, '.ttl').capitalize + " Ontology"

    # Extract other metadata
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

    # Process classes, properties, and individuals
    class_details = process_classes(classes, graph)
    class_ids = class_details.map { |cls| [cls[:uri], cls[:id]] }.to_h
    
    object_property_details = process_object_properties(object_properties, graph, class_ids)
    data_property_details = process_data_properties(data_properties, graph, class_ids)
    annotation_property_details = process_annotation_properties(annotation_properties, graph)
    individual_details = process_individuals(individuals, graph)

    # Generate HTML
    html_output = generate_html(
      ontology_title, ontology_type, ontology_created, ontology_rights, 
      ontology_description, ontology_depiction, makers, file_path,
      class_details, object_property_details, data_property_details,
      annotation_property_details, individual_details, prefixes, generation_time
    )

    # Save HTML to a file
    output_filename = File.basename(file_path, '.ttl') + '.html'
    output_file = "./html/#{output_filename}"

    File.open(output_file, 'w') do |file|
      file.write(html_output)
    end

    puts "  Documentation saved to: #{output_file}"
  rescue StandardError => e
    puts "  Error processing #{file_path}: #{e.message}"
    puts e.backtrace.join("\n  ")
  end
end

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

# Process class information
def process_classes(classes, graph)
  # Sort classes alphabetically by label
  classes.sort_by! { |cls| get_label(cls, graph)&.downcase || '' }

  # Process each class
  classes.map do |cls|
    class_label = get_label(cls, graph)
    next unless class_label

    class_comment_literal = graph.query([cls, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                          graph.query([cls, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
    class_comment = class_comment_literal ? class_comment_literal.to_s : ""
    class_id = generate_id(class_label)

    # Get subclasses
    subclasses = graph.query([nil, RDF::RDFS.subClassOf, cls]).map(&:subject).uniq
    subclass_details = subclasses.map do |sub|
      label = get_label(sub, graph)
      next unless label
      id = generate_id(label)
      { uri: sub, label: label, id: id }
    end.compact
    subclass_details.sort_by! { |sub| sub[:label].downcase }

    # Get properties with this class as domain
    properties_with_domain = graph.query([nil, RDF::RDFS.domain, cls]).map(&:subject).uniq
    properties_details = properties_with_domain.map do |prop|
      label = get_label(prop, graph)
      next unless label
      id = generate_id(label)
      { id: id, label: label }
    end.compact
    properties_details.sort_by! { |prop| prop[:label].downcase }

    # Get properties with this class as range
    properties_with_range = graph.query([nil, RDF::RDFS.range, cls]).map(&:subject).uniq
    properties_in_range_details = properties_with_range.map do |prop|
      label = get_label(prop, graph)
      next unless label
      id = generate_id(label)
      { id: id, label: label }
    end.compact
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
end

# Process object properties
def process_object_properties(object_properties, graph, class_ids)
  object_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

  object_properties.map do |prop|
    object_property_label = get_label(prop, graph)
    next unless object_property_label
    
    object_property_id = generate_id(object_property_label)
    comment_literal = graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
    comment = comment_literal ? comment_literal.to_s : ""

    # Get domains and ranges
    domains = graph.query([prop, RDF::RDFS.domain, nil]).map(&:object).uniq
    ranges = graph.query([prop, RDF::RDFS.range, nil]).map(&:object).uniq

    # Process domain information
    domain_details = domains.map do |domain|
      label = get_label(domain, graph)
      next unless label
      id = class_ids[domain] || generate_id(label)
      { id: id, label: label }
    end.compact

    # Process range information
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
end

# Process data properties
def process_data_properties(data_properties, graph, class_ids)
  data_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

  data_properties.map do |prop|
    datatype_property_label = get_label(prop, graph)
    next unless datatype_property_label
    
    datatype_property_id = generate_id(datatype_property_label)
    comment_literal = graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language == :en } ||
                    graph.query([prop, RDF::RDFS.comment, nil]).map(&:object).find { |l| l.language.nil? }
    comment = comment_literal ? comment_literal.to_s : ""

    # Get domains and ranges
    domains = graph.query([prop, RDF::RDFS.domain, nil]).map(&:object).uniq
    ranges = graph.query([prop, RDF::RDFS.range, nil]).map(&:object).uniq

    # Process domain information
    domain_details = domains.map do |domain|
      label = get_label(domain, graph)
      next unless label
      id = class_ids[domain] || generate_id(label)
      { id: id, label: label }
    end.compact

    # Process range information
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
end

# Process annotation properties
def process_annotation_properties(annotation_properties, graph)
  annotation_properties.sort_by! { |prop| get_label(prop, graph)&.downcase || '' }

  annotation_properties.map do |prop|
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
end

# Process individuals
def process_individuals(individuals, graph)
  individuals.sort_by! { |ind| get_label(ind, graph)&.downcase || '' }

  individuals.map do |ind|
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
end

# Generate HTML from processed ontology data
def generate_html(title, type, created, rights, description, depiction, makers, source_file, 
                 class_details, object_property_details, data_property_details,
                 annotation_property_details, individual_details, prefixes, generation_time)
  
  # Prepare navigation links by checking if sections have content
  navigation_items = []
  navigation_items << { href: "#classes", text: "Classes" } if class_details.any?
  navigation_items << { href: "#object-properties", text: "Object Properties" } if object_property_details.any?
  navigation_items << { href: "#datatype-properties", text: "Datatype Properties" } if data_property_details.any?
  navigation_items << { href: "#annotation-properties", text: "Annotation Properties" } if annotation_property_details.any?
  navigation_items << { href: "#individuals", text: "Individuals" } if individual_details.any?
  
  # Process maker information for display
  formatted_makers = makers.map do |maker|
    display_name = maker[:name].empty? ? maker[:uri].to_s : maker[:name]
    has_homepage = !maker[:homepage].empty?
    { display_name: display_name, homepage: maker[:homepage], has_homepage: has_homepage }
  end
  
  # Prepare header metadata
  metadata = {
    title: title,
    has_type: !type.empty?,
    type: type,
    has_created: !created.empty?,
    created: created,
    has_rights: !rights.empty?,
    rights: rights,
    has_description: !description.empty?,
    description: description,
    has_depiction: !depiction.empty?,
    depiction: depiction,
    has_makers: !makers.empty?,
    formatted_makers: formatted_makers,
    source_file: source_file,
    has_source_file: !source_file.nil?,
    generation_time: generation_time.strftime("%Y-%m-%d %H:%M:%S %Z"),
    navigation: navigation_items
  }

  template = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= metadata[:title] %></title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<body>

  <header>
    <h1><%= metadata[:title] %></h1>
    <% if metadata[:has_type] %>
      <p><strong>Type:</strong> <%= metadata[:type] %></p>
    <% end %>
    <% if metadata[:has_created] %>
      <p><strong>Created:</strong> <%= metadata[:created] %></p>
    <% end %>
    <% if metadata[:has_rights] %>
      <p><strong>Rights:</strong> <%= metadata[:rights] %></p>
    <% end %>
    <% if metadata[:has_description] %>
      <p><strong>Description:</strong> <%= metadata[:description] %></p>
    <% end %>
    <% if metadata[:has_depiction] %>
      <p><strong>Depiction:</strong> <a href="<%= metadata[:depiction] %>"><%= metadata[:depiction] %></a></p>
    <% end %>
    <% if metadata[:has_makers] %>
      <p><strong>Creators:</strong></p>
      <ul>
        <% metadata[:formatted_makers].each do |maker| %>
          <li>
            <%= maker[:display_name] %>
            <% if maker[:has_homepage] %>
              (<a href="<%= maker[:homepage] %>">Homepage</a>)
            <% end %>
          </li>
        <% end %>
      </ul>
    <% end %>
    <% if metadata[:has_source_file] %>
      <p><strong>Source TTL:</strong> <%= metadata[:source_file] %></p>
    <% end %>
    <!-- Navigation links -->
    <% if metadata[:navigation].any? %>
      <nav>
        <ul>
          <% metadata[:navigation].each do |item| %>
            <li><a href="<%= item[:href] %>"><%= item[:text] %></a></li>
          <% end %>
        </ul>
      </nav>
    <% end %>
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
    <p>Page last generated: <%= metadata[:generation_time] %></p>
  </footer>

</body>
</html>
  HTML

  # Create new renderer with the template and bindings
  renderer = ERB.new(template)
  renderer.result(binding)
end

# Set default task
task default: :list_ttl_files