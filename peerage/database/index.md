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




