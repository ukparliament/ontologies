## Greetings,

I would like to share our weekly progress report with you. Before I dive into the details, I would like to apologize on behalf of our team for the delay in updating you. We encountered a small hurdle, but we have since rectified the situation and are eager to get back on track.

Firstly, I would like to update you on our team's progress in reference data management. Our team has been working diligently on planning for the upcoming general election. Our librarians, Anna and Phil, have done an excellent job of tidying up our party data. Phil has successfully removed any irrelevant parties from MNIS, those with no candidates or parliamentary whippings. Anna, on the other hand, has used her information management expertise to deduplicate party information, resulting in a more streamlined and organized system. In addition, she has also completed the task of tidying up party affiliation start dates, which had been a problem for a few members in the House of Lords. We appreciate their hard work and dedication to these tasks.

Moving on to software engineering, we have made progress in clearing up a few constituency-related queries. We now have a better understanding of the database fields that require our attention and the ones that we can safely ignore. For instance, we have determined that the 'Locata ID' and 'OS Name' fields are no longer in use, and we can disregard them. However, we have discovered that the 'geometries' field is still in use and holds a constituency boundary shape file, which is used to render maps on constituency pages. The process of acquiring and uploading these files is still a mystery to us, and we are working to solve it.

Once again, we apologize for the delay in providing you with this update. Our team is committed to making progress and ensuring that we provide you with accurate and timely information. We appreciate your continued support.

## Really Simple Syndication

Our team of dedicated librarians is committed to managing large volumes of data, which involves intricate processes such as subject indexing, procedural indexing, and linking relevant information to reflect reality. While some of our older systems have automated feeds, others require significant investments of time, resources, and effort to develop.

In our previous update, Librarian Anya engaged the services of computational cabin boy Michael to explore the potential of the bill system API to create feeds. Our bill papers app has now gone live, offering RSS feeds for bill papers by type and by a given bill. This development allows our readers to receive updates on bills of interest in their preferred feed readers or email clients.

Michael has also enhanced the app's performance by integrating left joins and inner joins. This upgrade has significantly improved the speed of data processing, a critical factor in our mission-critical librarianship operations.

Anya has been working with Library data scientist Louie to investigate the possibility of integrating our new RSS feeds into Sharepoint, where our librarian's task lists are kept. Additionally, Anya has requested that Michael explore the potential of the committee system API to create RSS feeds for committee work packages, oral evidence transcripts, and ICS feeds of committee meetings.

We have already developed a feed of oral evidence transcripts, with plans to create feeds for committee work packages, committee work packages by type, and ICS feeds of committee meetings and other related information. However, we are mindful of not overwhelming the API with data requests and are working to balance this with keeping our feeds updated regularly.

In summary, we remain committed to providing our readers with timely and relevant updates while leveraging innovative technologies and approaches to enhance our operations.

## Eggciting news

Imagine awakening on the Spring Equinox Sunday, only to discover the daunting task of resetting 100 clocks. This is precisely the predicament that our team of skilled librarians frequently encounter whenever there is a change in planned sitting days. The scrutiny periods for instruments outlined in legislation often require the consideration of assorted patterns of sitting days. At any given time, we have approximately 100 instruments subject to such scrutiny periods awaiting review by Parliament. As a result, any change in sitting days leads to a time-consuming process of updating each clock end, which can be quite tedious and unfulfilling.

Fortunately, we have our beloved egg timer, which can take into account various types of days to count, the number of days to count, and the date from which we start counting, and produce an anticipated end date automatically. Our latest experiment involves integrating the procedure editor into the egg timer to streamline the process. To that end, our team member Jianhan has been working diligently to update both the procedure editor database and application to ensure compliance with clock standards. The updates describe calculation styles, clocks, and day counts, all of which are essential for egg timer integration. We have devised a plan for migrating and populating the new components of the model to data platform mk 3, as well as a sketch of the necessary code to facilitate communication between the two systems. We will provide more updates on this soon.

In other egg timer news, we are pleased to announce that Librarian Jayne and Michael have collaborated once again to close yet another tiny egg timer gap. Although we had previously accounted for Parliament periods, dissolutions, sessions, prorogations, adjournment days, and two varieties of sitting days, we had a gap in our data regarding recesses. This gap has now been resolved, and the egg timer now includes listings of recess dates, which are also available as subscribeable calendar feeds. We pride ourselves on our meticulousness and attention to detail, and we do not take shortcuts in our serialization processes. If your calendar lacks automated recess dates, we invite you to subscribe to our feed.

## Procedural parsing

As a team, we take immense pride in being trailblazers in the field of machine-readable, logical and arithmetic parliamentary procedure maps. Our unparalleled expertise has enabled us to achieve a significant milestone by successfully forcing a machine to parse such a map - an achievement that is unprecedented in the industry. However, we do not believe in complacency and strive to continuously improve our processes. To this end, our team member Jianhan has dedicated his time this week to translating the parsing code scribblings of Young Robert and Michael into production-ready code. This has resulted in our parsed procedure steps being annotated with occurrence scores, which provide valuable insights to our team of librarians regarding the likelihood of specific procedure steps occurring. We take pride in our exceptional work and are excited about the promising possibilities it holds.

## Map making

Upon her return from a well-deserved break, Librarian Jayne has been diligently focused on procedural cartography. The recent machinery of government change has caused a ripple effect, with parliamentary processes shifting and evolving. As a result, the former scrutinizing committee, BEIS, has been replaced by the new Business and Trade Committee, rendering LRO procedure routes to BEIS a thing of the past. New steps and routes have been implemented to accommodate this change.

A similar adjustment has been made to the CRaG treaty map, with the International Trade Committee now replaced by the Business and Trade Committee. In treaty procedure news, Jayne has added new steps and routes to deposit government negotiation objectives, committee reports, and government responses.

However, the current treaty website does not currently support steps occurring before the treaty is laid. We anticipate that software engineering colleagues will make necessary adjustments to rectify this. Once resolved, we will be able to support pre-laying scrutiny of treaties, a significant achievement for treatyheads everywhere. Congratulations to Jayne for her excellent work in navigating these changes.

## What is the range of a breathalyser?

At this juncture in the season, it was our expectation to provide an update on the near-completion of our depositing model, as outlined in the depositing ontology. Regrettably, we find ourselves embroiled in a theoretical dispute regarding the essence of deposits, papers, and artefacts, exacerbated by the contentious inclusion of a breathalyser deposit, which has led to discussion of HTTPRange-14 concepts, an undesirable prospect. We have solicited the expertise of House of Lords librarians from the depositing faction to assist us in disentangling ourselves from the complexities of concepts that HTTP is unequivocally incapable of dereferencing.

On a more positive note, we can confirm that our initial iteration of the related item model, which is designed to streamline the manner in which our team of expert librarians link diverse parliamentary resources originating from various systems, is now considered to be comprehensive, albeit somewhat verbose. Currently, we rely solely on a single link type, related item, as an experiment to explore the mental models of librarians. We have initiated a spreadsheet to establish whether our model can adequately capture the required expressions, and we await a considered second opinion from trusted confidant Silver regarding our adoption of a ternary approach that may be too expansive by one or two triples.

We can also confirm that our written statement making model, which serves as a mere conduit between our making available model and our written statement model, is considered to be complete, albeit with limited excitement.

Lastly, our librarian Jayne, along with computational midshipmen Young Robert and Michael, have dedicated significant time and effort to refine and restructure our treaty model, as detailed in the treaty ontology. Although some comments are still pending, we believe that when combined with our making available, laying, and paper models, the revised treaty model will make sense.

## Librarian mapping

In an effort to extend our mapping capabilities, we have expanded our focus to include the mapping of librarians themselves. Under the guidance of our esteemed 'brarian leader Anya and her skilled collaborator Michael, we were joined by the distinguished 'brarian Bryn for a productive sketching session. Our aim was to chart the range of librarian services that are offered, extending beyond the basic digital interface.

Our user base is diverse, and enquiries are received through a variety of channels, requiring careful management, triage, and analysis. This presents an ongoing challenge that requires further attention. Fortunately, we have a shining example to emulate in Librarian Jayne's impressive SPARQL library.

With sufficient time and a suitable whiteboard, we look forward to engaging in robust discussion with Bryn on the complex web of services that underpin our offerings. Our goal is to move beyond the narrow view of "products" and instead focus on delivering comprehensive and valuable services that meet the needs of our diverse user base. In this way, we can achieve multiple goals with a single effort.

# Daytrippers

In these parts, we understand the importance of work-life balance. Occasionally, we have the opportunity to combine work and play, as was the case last Thursday when Anya, Young Robert, and Michael traveled by train to Lewes to meet with Silver at a local establishment. Although not directly on the seaside, the location was in close proximity, and we enjoyed the refreshing sea breeze.

During the meeting, Anya, who was recently appointed as Product Owner for our new search service, expressed confusion regarding the distinctions between various management roles such as Product Owners, Product Managers, Service Owners, Service Managers, Project Managers, and Delivery Managers. In an effort to provide clarity, we attempted to use beer glasses and beer mats to construct a taxonomy, but we were unable to make significant progress. Regrettably, our confusion remained unresolved.

After concluding our opening discussion, we focused on the main objective of the day. Young Robert and Jianhan were assigned the challenging task of extracting triples from data platform mk 1, reshaping them, and loading the results into data platform mk 4. During a virtual discussion, Silver mentioned the potential utility of SPARQL CONSTRUCT queries for such endeavors. However, due to Anya and Michael's limited experience in SPARQL, this suggestion appeared to be beyond their current capabilities. Silver's exceptional patience and illustrative skills enabled us to depart from the establishment with a greater understanding of the matter. We are most grateful to Silver for his invaluable assistance.

Following the conclusion of our work obligations, Michael suggested to Young Robert a brief resumption of their fabled dodgem battle at Brighton Pier. Sadly, Robert grew fatigued and departed before the opportunity arose. Undeterred, Anya, Silver, and Michael took the train to Brighton, where they were joined by data scientist Louie. The group convened at a local establishment where they thoroughly enjoyed each other's company.

