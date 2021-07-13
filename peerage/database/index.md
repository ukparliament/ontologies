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



