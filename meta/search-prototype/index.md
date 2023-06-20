# Search prototype handover notes

## Background

Parliamentary Search is a service run by <abbr title="Indexing and Data Management Section">IDMS</abbr> in the House of Commons Library. It exists to provide a unified search over parliamentary material originating in line of business systems in the procedural offices of both Houses. It is only available to users on the parliamentary network. The user base are chiefly researchers in the Commons and Lords Libraries responding to enquiries originating from Members of both Houses, or in the course of preparing [research briefings](https://researchbriefings.parliament.uk/). It’s also used by Library front of House staff responding to requests from Members and by the staff of the procedural offices.

There is a [publicly available version of Parliamentary Search](https://search-material.parliament.uk/), but functionality is limited to the point of being unusable.

## Data and content flow 

The bulk of the data and content in Parliamentary Search originates in line of business systems in the procedural offices of the two Houses. Where APIs to these systems have not been built, some data is keyed into a system called <abbr title="Odds and Sods Information System">OASIS by</abbr> staff in the Indexing and Data Management Section in the Commons Library. Research Briefings from both Libraries are also included.

Where APIs exist, these send out change notifications to a service called Harvester. Harvester takes these notifications, transforms them to RDF and pushes data into the Search and Indexing triple store.

Once the data is in the Search and Indexing triple store, it is subject indexed and procedurally indexed using the [House of Commons Thesaurus](https://explore.data.parliament.uk/?endpoint=terms) by staff in IDMS. Material is also interlinked again by IDMS staff, this being necessary because the source systems are not interlinked and related material is not related as data. For example: a written statement being a correction to an earlier answer where the statement is not linked to the answer and the answer is not linked to the statement.

From the Search and Indexing triple store, changes are propagated by a system called Poller into a [SOLR](https://en.wikipedia.org/wiki/Apache_Solr) search index.

Search application code sits on top of SOLR, presenting a search form and result view to users. This application also calls the <abbr title="Semantic Enhancement Service">SES</abbr> API, in order to translate thesaurus identifiers stored in SOLR to labels in the Thesaurus.

## Known limitations 

There are a number of limitations to Parliamentary Search, many of which we cannot fix. Source systems models could be improved, the database schemas not being true to the domain of parliamentary procedure. Data entry is focussed on the following day’s report and lacks consistent standards over time. The data we deal with dates back decades and information management practice has changed over time. For example: it is reasonable to expect a written question to have a date tabled but this data is not available for older House of Lords’ written questions. Changes to systems, publishing practices and information management mean the date we’re dealing with might be described as “bumpy”.

In addition, there is no validation or error logging in the Harvester ETL meaning not all the data we expect to be available is available and that the data in the Search and Indexing triple store may be misshaped. Because the triple store is ‘open world’ with no constraints - for example: [SHACL](https://en.wikipedia.org/wiki/SHACL) - it’s perfectly possible for content to have more than one title, more than one date of publication, more than one parliamentary session associated and so on.

## The long term plan

In the longer term we hope to replace the entire Parliamentary Search stack from data ingest up. This means a replacement of the Harvester ETL system, a replacement triple store - the Open Data Platform, [new RDF data models](https://ukparliament.github.io/ontologies/), new tools for IDMS, a replacement for Poller, a new search index service and a new search interface. Unfortunately, the line of business systems are outside our control so will remain as is. A [data flow diagram for this longer terms plan](https://github.com/ukparliament/ontologies/blob/master/meta/data-flow/odp/odp.svg) is available on GitHub.

## The short term plan
In the short term, we’re looking to replace the search interface and the search index service. We may also need to replace or refactor Poller and the SES API. This phase of work does not rely on replacing the triple store, the data models, the IDMS tooling or the Harvester system. The scope of work can be seen in the grey 'Search MVP' box on digram linked to above.

## The prototype
We’re currently looking to prototype a new search interface in as lightweight a way as possible. We currently have three components:

### Search mock
Our current install of SOLR is too brittle to prototype against. For that reason, we’ve built a lightweight way to publish static files, capturing real API calls to SOLR for assorted document types. Search mock is a Ruby on Rails application, [running on Heroku](https://search-mock.herokuapp.com/search-mock), [proxied to api.parliament.uk](https://api.parliament.uk/search-mock). The [source code](https://github.com/ukparliament/search-mock) is available on GitHub.

Search mock makes API data available as XML, JSON and Ruby objects for result sets and objects. Populating new files is somewhat painful. Robert is able to query live SOLR via the Azure API manager and export any API responses required for prototyping.

### Search prototype

A second Ruby on Rails app takes the Ruby object data from search mock and serialises it to HTML. The prototype code is also [served from Heroku](https://search-prototype.herokuapp.com/search-prototype/) and [proxied to api.parliament.uk](https://api.parliament.uk/search-prototype). The [source code](https://github.com/ukparliament/search-prototype) is also available on GitHub.

At some point soon, we hope to have a shadow copy of SOLR running, at which point, we’ll turn off search mock and point the prototype to shadow SOLR instead. At present, we have no timescales for this.

### The CSS

CSS is hosted outside of Rails to support collaboration with colleagues in Customer Experience and Design. It’s [hosted on GitHub](https://github.com/ukparliament/design-system/blob/main/trrb.css) and served as GitHub pages. GitHub page build times mean pushed changes take time to propagate. You may wish to build CSS local to the Rails app and push to the external repo when happy.

### Testing and acceptance

The search prototype application currently has no tests - sorry. Because the content available to Parliamentary Search is “bumpy” we need to document all the cases where certain data attributes are available and where they are not. Most of the domain knowledge for this lives in IDMS but we anticipate more will drop out as we explore the data and build out the views. We could spend time upfront documenting all these edge cases - many of which are not very “edgy” - but we wouldn’t be able to document everything without data exploration.

For that reason, we’d like to take a [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development) / [Behaviour Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development) approach to the prototype. We envisage you working with librarians in IDMS to outline the attributes available for each document type and how that has varied over time. These will be captured as tests. Templates will then be written to pass these tests. The test suite should build into a library we can use for regression testing in the future.
 
##  What you’ll need

Access to IDMS for domain knowledge around what’s available and what isn’t.

Access to Robert to get example SOLR API response calls.

An Heroku account and access to both repos there.

Access to all three GitHub accounts.

## Key contacts

[Anya Somerville](mailto:somervillea@parliament.uk) - Head of IDMS

[Robert Brook](mailto:BROOKR@parliament.uk)

[Yomi Ogunde](mailto:OGUNDEY@parliament.uk)
