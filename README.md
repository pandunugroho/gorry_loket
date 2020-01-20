# Gorry Loket

Online Loket reservation


Introduction
---
This is a database schema using MySQL (one of several types of RDBMS)


Check-List
---

Constraints and Requirement
----

- [X] One event will have exactly one location
- [X] One location might have one or more event
- [X] One event will have exactly one schedule
- [X] One schedule might start and end at different day
- [X] One event might have more than one ticket type
- [X] One ticket type must have price and quota, if quota is less than 1 then the ticket cannot be purchased
- [X] Customer will be able to make transaction to purchase ticket event
- [X] Customer can purchase ticket event many times
- [X] For each transaction, customer only can purchase ticket within same event
- [X] Within one transaction, customer can purchase more than 1 ticket type, and more than 1 qty per ticket type


Task
----
- [X] 1. Create Database Schema using RDBMS based on Constraints and Requirements above. You also open if you want to use NoSQL like MongoDb

- [X] 2. Create Web Service JSON API with these functionalities:

Endpoint | Relative Path | Method | Description | Checklist
--- | --- | --- | --- | ---
Create Event | */event/create* | POST | Endpoint to create new event | DONE
Create Location | */location/create* | POST | Endpoint to create new location | DONE
Create Ticket | */event/ticket/create* | POST | Endpoint to create new ticket type on one specific event | DONE
Get Event | */event/get_info* | GET | Endpoint to retrieve event information, including location data and ticket data | DONE
Purchase Ticket | */transaction/purchase* | POST | Endpoint to make a new purchase, customer data is sent via this API | DONE
Transcation Detail | */transaction/get_info* | GET | Endpoint to retrieve transaction created using endpoint *Purchase Ticket* | DONE
# gorry_loket
