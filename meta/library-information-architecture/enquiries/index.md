# Requirements

A [list of requirements is given here](https://docs.google.com/spreadsheets/d/1NEsWG8lNUEofQehiz26d8NT3j8EEHPE51zHMvFhDwEc/edit?usp=sharing).

## Questions for search

* How does Illumin handle search? Is it AND or OR combinations?

* How does Illumin handle stemming?

## Questions for integration

* How often should the refresh script run? Daily?

* Do we want a manual tigger for the refresh?

* How do we handle concepts deleted from the Thesaurus? How do we handle the splitting and merging of concepts?

## Taxonomy API

The [taxonomy API is here](https://api.parliament.uk/ses/). An API key is required for access.

The straw-man proposal below requires three calls:

<table>
	<thead>
		<tr>
			<td>Name</td>
			<td>Client sends</td>
			<td>Server returns</td>
			<td>URL</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Partial string match</td>
			<td>A string as entered by the user of Illumin</td>
			<td>All concepts partially matching the string. For each concept an ID, a preferred label, all non-preferred labels and a scope note. Plus all these values for all concepts in the ancestor chain.</td>
			<td>https://api.parliament.uk/ses/select.exe?TBDB=disp_taxonomy&TEMPLATE=service.json&SERVICE=search&QUERY=Dogs%20in%20crime</td>
			<td><a href="ses/string-match-response.json">Sample response</a></td>
		</tr>
		<tr>
			<td>ID lookup</td>
			<td>The ID of a concept</td>
			<td>The concept having that ID with the ID, a preferred label, all non-preferred labels and a scope note. Plus all these values for all concepts in the ancestor chain.</td>
			<td>https://api.parliament.uk/ses/select.exe?TBDB=disp_taxonomy&TEMPLATE=service.xml&SERVICE=term&ID=408172</td>
		</tr>
		<tr>
			<td>ID lookup on presence in taxonomy</td>
			<td>The ID of a concept/td>
			<td>Whether or not the concept still exists in the taxonomy. If the concept does exist, returns the ID, a preferred label, all non-preferred labels and a scope note. Plus all these values for all concepts in the ancestor chain.</td>
			<td>https://api.parliament.uk/ses/select.exe?TBDB=disp_taxonomy&TEMPLATE=service.xml&SERVICE=term&ID=408172</td>
		</tr>
	</tbody>
</table>

### Sample response

A [sample response for a string match is given here](ses/string-match-response.json).

## Proposed process flows

### [Proposed indexing flow](indexing-flow/indexing-flow.svg)

### [Proposed periodic refresh flow](periodic-refresh-flow/periodic-refresh-flow.svg)