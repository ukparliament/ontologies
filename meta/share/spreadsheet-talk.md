# Some tips on making spreadsheets

# Who is the audience, what is the goal?

# Who is the audience

* people

* machines

(there should be nothing in a spreadsheet that a machine can't parse)

# Things that should not be in a spreadsheet

* colour coding

* columns split by / or ; or , < start date and end date

* merged cells (colpan, rowspan) < header rows

* zeroes that aren't zeroes

* yes and no (use true and false)

* multiple tables in the same sheet

* unnecessary multiple sheets

* hidden cells

* link text < include urls

# Things to bear in mind

format cells appropriately and consistently

for example, choose a date format and stick to it, choose a float format and stick to it

you'll never regret a notes column but ...

# Try drawing the thing first (domain modelling)

example of very simple election model x 3 / 4

think about cardinality

# Process flow modelling

example of opposition day thingy

# Put words to the things you draw

Naming things is hard

# Normalisation and cleaning

example of ayes / naes slash separated

revisit your notes fields regularly, there's probably stuff that should be in its own column

# Normalisation into separate sheets

maybe a rush example: eton, eton college, public, public school, Public school

names though time (scumley, bosworth etc)

# Spreadsheet > relational database

Every table is a sheet

Notation of a single table

Sheets are tied together with keys

Notional of cardinality

Example election schema

# Interoperability

Filtering

Pivoting tables

Using formulas to look up values from a sheet / column

# Website made of spreadsheets








