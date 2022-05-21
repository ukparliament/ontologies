# 2022 - Week 20

## A peerage database - finally live

Way back in the mists of time, way before we even got locked down, we came to the conclusion we needed a proper model for peerages. Our current descriptions describing a title for a Member but having no notion of inheritance causing different bottoms to occupy the same seat at different points in time. A problem that also extended to our modelling of bishops. More of which in future episodes.

Knowing where to start with a peerage model proved tricky, none of us being experts in matters of letters patent, special remainders, ranks and rank labels. Luckily we struck gold when David generously handed us his lovingly compiled database of peerage creation data. Which meant we at least had something to poke at. Poking a database being one of our favourite ways to explore a domain. Unfortunately, David's data was set up to describe the act of peerage creation in the UK and, by extension, the first holder of any hereditary peerage but not any subsequent chain of holders. We got luckier still when David and College of Arms Grant offered use of their considerable brains to help with the reshaping task. Librarian Ned chipping in to fill gaps with his considerable librarian skills. Which means we now have a model that can be used to describe peerage creation, types of peerages, kingdoms in which peerages were created and holders of a given peerage over time. A model that young Robert and Michael are preparing to turn into example RDF for Viscount Thurso. Lovely stuff. Thanks David. Thanks Grant.

A side effect of this modelling effort was a newly reshaped database compliant with the new model. The new database also containing sample peerage holding data and a handful of pre-UK created peerages. Though sadly we lacked the capability to make this new database editable and available online. So we approached Paul, thinking this new dataset would compliment the Rush database of Commons Member which the History of Parliament Trust already host. Happily, Paul was in agreement and stumped up the funds to pay James to turn our Postgres scribblings into a properly supported website with built in editing capabilities. This week, David came back with a fresh dump from his Access database, James converted to Postgres, Michael ran our reshaping tasks, Ned realigned identifiers for side-loaded data, sent the new data back to James and we are now live. If peerage data is your thing, please take a look.

Now we have the database and the ability to easily edit it, we hope to add more in the way of pre-UK peerages and more in the way of subsequent holders. Most probably concentrating on those hereditary peerages being held by current and potential Members of the Lords. If you're a peerage expert and would like to help out, please do get in touch.

## Always be shipping

A new peerage website was not all that went live this week. Librarian Jayne and her computational helpmate Michael also pressing push on a new version of our beloved egg timer. This time handling four - count 'em - different calculations for different various flavours of legislative reform orders and updating the instructions accordingly. A small task made much easier by already having calculation code matching the definition of days set out in the legislation. In truth, it took longer to agree labelling with JO Jane and JO Philipp, than it did to amend the code.

## Gender, sex and peerages

There have been a number of occasions of late when we've had cause to question our notions of sex and gender. Which is why Wednesday saw an actual in person meeting with Research Director Grant, Librarian Anya, House of Lords Kirsty, Michael and a whiteboard. First up for discussion was the Gender Recognition Act 2004 which, it would seem in hindsight might be better titled the Sex Recognition Act. Legally speaking, there are two recognised sexes: male and female. A person having one sex at one time. Either as registered at birth or via a Gender Recognition Certificate. Or sex recognition certificate if you will. Gender is a whole other kettle of fish, the list being inexhaustible and being more a matter of how you feel - gender identity - and how you express - gender identity. We now have a straw man database schema to capture gender. The sex part being none of our business.

Except, except, except. If you've been following Lords' Business, you'll know that Matilda Simon has successfully petitioned her claim to have succeeded to the Barony of Simon of Wythenshawe. Matilda was born male and transitioned to the female gender. She has not taken the legal route and does not have a Gender Recognition Certificate, so, legally speaking is of the male sex. The peerage in question being a barony should she successfully stand for election as an excepted hereditary peer, she will be summoned to the Lords as Lord Simon. At which point she may petition the Queen for a more gender appropriate form of address. This raises a problem with our peerage model which we had thought complete. A person's title being generated from a combination of the rank of the peerage they hold they're gender. Or sex. We're not sure. If our gender class is indeed describing gender, Matilda would be entered as the holder of a barony with the gender female, resulting in the title Baroness Simon. Which would be at odds with her title on the writ of summons to the House of Lords. If our gender class is in fact describing sex, she would be entered as male, resulting in the title Lord Simon. Which would agree with the writ but not any successful future petition. We remain confused about sex and gender in this area so, if we have got anything wrong here or misunderstood this somewhat complex problem, please do get in touch. In the meantime, if you are or know a lawyer who might be able to help us parse the Gender Recognition Act - in particular sections 9 and 16 - please do get in touch.



## Return to public bill mountain

https://trello.com/c/IcA5bk5Z/32-senedd-lcm



## Prodding the procedure parser

https://trello.com/c/JNPH40BK/466-whats-a-business-step-whats-a-summation

Database tidied

https://trello.com/c/6FFah63T/87-change-the-behaviour-of-an-and-step-to-allow-inputs-and-outputs-with-status-of-allows

https://trello.com/c/lp0qM7Dw/83-change-the-behaviour-of-all-steps-to-no-longer-propagate-untraversability


## Member data

https://trello.com/c/aPuwkgIe/66-ending-of-party-affiliations



## Fascism, nazism and taxonomic transitivity