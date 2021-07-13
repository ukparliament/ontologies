# Database tables

## administrations

Column | Type | Nullable | Key | Comments
id | integer | false | primary | 
number | integer | true | | Should be non-null
prime_minister | text | false | | Should be non-null
start_date | date | true | |  Should be non-null
end_date | date | true | |
colour_code | text | true | |

## announcement_types

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
name | text | true | |  Should be non-null

## announcements

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
announced_on | date | false | |
in_gazette | boolean | true | | Should be default false
gazette_url | varchar(255) | true | |
notes | text | true | |
announcement_type_id | integer | true | fk:announcement_types(id) |
administration_id | integer | true | | Should be fk to administrations(id)

## genders

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
label | varchar(10) | false | |

## jurisdictions

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
label | varchar(100) | false | |

## kingdom_ranks

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
rank_id | integer | false | fk:ranks_id |
kingdom_id | integer | false | fk:kingdoms_id |

## kingdoms

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
name | varchar(255) | false | | 
start_on | date | true | | 
end_on   | date | false | |

## law_lord_incumbencies

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
appointed_on | date | false | |
end_on_ | date | true | |
vice | text | true | |
old_office_ | text | true | |
notes | text | true | |
annuity_from | date | true | |
annuity_london_gazette_issue | integer | true | |
annuity_london_gazette_page | integer | true | |
appointment_london_gazette_issue | integer | true | |
appointment_london_gazette_page | integer | true | |
peerage_id | integer | | fk:peerages_id | Should be not null
jurisdiction_id | integer | |  | Should be not null. Should be fk to jurisdictions(id)

## letters

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
letter | varchar(100) | false | |
url_key | char(1) | false | |

## letters_patent_times

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
label | varchar(20) | false | |

## letters_patents

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
label | varchar(20) | false | |
patent_on | date | false | |
person_prefix | varchar(20) | true | | 
person_suffix | varchar(20) | true | | 
previous_of_title | boolean | false | | 
previous_title | varchar(255) | true | |
previous_rank | varchar(255) | true | |
ordinality_on_date | integer | true | |
citations | text | true | |
announcement_id |integer | true | fk:announcements(id)
letters_patent_time_id | integer | true | fk:letters_patent_times(id) |
person_id | integer | true | fk:people(id) | Should be not null
kingdom_id | integer | true | fk:kingdoms(id) | Should be not null
previous_kingdom_id | integer | true | fk:kingdoms(id) |
reign_id | integer | true | fk:reigns(id) |

## monarchs

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
name | varchar(255) | false | |
date_of_birth | date | true | |
date_of_death | date | true | |
wikidata_id | varchar(20) | true | |

## peerage_holdings

Column | Type | Nullable | Key | Comments
id | integer | false | primary |
ordinality | integer | false | |
start_on | date | true | |
end_on | date | true | |
notes | varchar(2000) | true | |
person_id | integer | false | fk:people(id) |
peerage_id | integer | false | fk:peerages(id) |