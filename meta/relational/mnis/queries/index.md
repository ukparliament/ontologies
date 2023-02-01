# Member data queries

A library of queries for data about Members of the House of Commons and the House of Lords. Maintained and used by the House of Commons Library. Feedback and requests are welcomed. Please email [RIIDMSMailbox@parliament.uk](mailto:RIIDMSMailbox@parliament.uk).

Build your own queries using our [MNIS Prodder](https://mnis-prodder.herokuapp.com/) - a simple query interface using the public [Members API](https://data.parliament.uk/membersdataplatform/default.aspx), made available under the Open Parliament Licence.


## House of Commons

[Current Members of the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=house=commons&include=)

[Current and former Members of the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Chouse=commons&include=)

[Current Members of the House of Commons, representing constituencies in England](https://api.parliament.uk/mnis-prodder/parse?filter=house=both%7Cconstituencyinarea=England&include=)

[Current Members of the House of Commons, representing constituencies in Northern Ireland](https://api.parliament.uk/mnis-prodder/parse?filter=house=both%7Cconstituencyinarea=Northern%20Ireland&include=)

[Current Members of the House of Commons, representing constituencies in Scotland](https://api.parliament.uk/mnis-prodder/parse?filter=house=both%7Cconstituencyinarea=Scotland&include=)

[Current Members of the House of Commons, representing constituencies in Wales](https://api.parliament.uk/mnis-prodder/parse?filter=house=both%7Cconstituencyinarea=Wales&include=)

[Current and former Members of the House of Commons, including Members subsequently elevated to the House of Lords](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Chouse*commons&include=)

[Current eligible Members of the House of Commons whipped to the Conservative Party with no current incumbency in a Government position](https://api.parliament.uk/mnis-prodder/parse?filter=house=commons%7Ciseligible=true%7Cpartyid=4%7Choldsgovernmentpost=false&include=)

[Female Members of the House of Commons elected at the 2005 General Election](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Cgender=F%7Chouse*commons%7Creturnedatelection=2005%20general%20election&include=)

## House of Lords

[Current Members of the House of Lords](https://api.parliament.uk/mnis-prodder/parse?filter=house=lords&include=)

[Current and former Members of the House of Lords](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Chouse*lords&include=)

[Current Members of the House of Lords who are eligible to sit, including full details on how to correctly write their title and rank](https://api.parliament.uk/mnis-prodder/parse?filter=house=lords%7Ciseligible=true/PreferredNames/)

[Current Members of the House of Lords who hold a government position](https://api.parliament.uk/mnis-prodder/parse?filter=house=lords%7Choldsgovernmentpost=true&include=)

## House of Commons and House of Lords

[Current Members of the House of Commons and the House of Lords](https://api.parliament.uk/mnis-prodder/parse?filter=house=both&include=)

[Current and former Members of the House of Lords and the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Chouse=both&include=)

[Current female Members of the House of Lords and the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=gender=F%7Chouse=both/)

[Current and former female Members of the House of Lords and the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Cgender=F%7Chouse=both&include=)

[Current male Members of the House of Lords and the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=gender=M%7Chouse=both&include=)

[Current and former male Members of the House of Lords and the House of Commons](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Cgender=M%7Chouse=both&include=)

[Former Members of the House of Commons and the House of Lords that left either House within the last 31 days](https://api.parliament.uk/mnis-prodder/parse?filter=membership=all%7Cleftdays=31%7Chouse=both&include=)
