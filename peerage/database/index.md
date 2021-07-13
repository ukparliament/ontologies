# Database tables

## administrations

Column | Type | Nullable | Key
id | integer | false | primary
number | integer | true |
prime_minister | text | false |
start_date | date | true |
end_date | date | true |
colour_code | text | true |

## announcement_types

Column | Type | Nullable | Key
id | integer | false | primary
name | text | true |

## announcements

Column | Type | Nullable | Key
id | integer | false | primary
announced_on | date | false |
in_gazette | boolean | true |
gazette_url | varchar(255) | true | 
notes | text | true | 
announcement_type_id | integer | true | announcement_types(id)
administration_id | integer | true | administrations(id)



