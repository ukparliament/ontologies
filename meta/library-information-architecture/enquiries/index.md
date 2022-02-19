# Requirements

* A keyword search must return enquiries indexed with a concept having that keyword as either a preferred label or a non-preferred label.

* A keyword search must return enquiries indexed with a concept being an ancestor of a concept having that keyword as either a preferred label or a non-preferred label.

* A report must be available in the form of a CSV listing all enquiries and all concepts used to index those concepts. Enquiries will be duplicated over rows wherever an enquiry has been indexed with multiple concepts. The CSV must include the ID of the enquiry and the ID and preferred label of the concept. This will be used to reindex when concepts are removed from the taxonomy.

## Questions

* How does Illumi handle search? Is it AND or OR combinations?

* How does Illumi handle stemming?

* How often should the refresh script run? Daily?

* Do we want a manual tigger for the refresh?

## Proposed process flows

### [Proposed indexing flow](indexing-flow/indexing-flow.svg)

### [Proposed periodic refresh flow](periodic-refresh-flow/periodic-refresh-flow.svg)