# Step collections

Business steps may form part of a step collection.

A step collection may relate to a single procedure, for example: the House of Commons public bill third reading step collection is related to the public bill procedure.

A step collection may relate to a single House, for example: the House of Commons public bill third reading step collection is related to the House of Commons.

Step collections are used to group business steps, for example:

* A set of steps from which the procedure starts. This collection is used by the procedure parsing code to determine the set of steps from which to start parsing.

* A set of steps by which the procedure concludes. Concluded work packages are those with a business item actualising a step in this collection.

* A set of website visible steps. This collection is used to determine which actualised business steps should display on a work package timeline page.

* A set of Member action steps. This collection is used to identify steps where a Member may take action, for example: table a motion.

Capturing step collection membership reduces the hardcoding of step IDs across applications.

The following queries show a list of business items that belong to each step collection in the data:

* [All step collections](https://api.parliament.uk/s/42201905)
* [Start steps](https://api.parliament.uk/s/88e0cd2a)
* [End steps](https://api.parliament.uk/s/d15232c6)
* [Bicameral end steps](https://api.parliament.uk/s/3e4e0449)
* [Website visible steps](https://api.parliament.uk/s/2bd9f287)
* [Committee raises concerns steps](https://api.parliament.uk/s/bb5c3c3b)
* [Motions tabled steps](https://api.parliament.uk/s/dcc9c70e)
* [Debate steps](https://api.parliament.uk/s/0a7b8541)
* [Proposed negative statutory instruments upgraded to affirmative](https://api.parliament.uk/s/9a248073)
