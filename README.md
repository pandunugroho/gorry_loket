# Gorry Loket

Online Loket reservation server-side application, build with Node.js, web framework Express.js, and promise-based Node.js ORM, Sequelize.
This is a database schema for online loket reservation using MySQL (one of several types of RDBMS)


What can you do with this bunch of file?
---
You can get information about some event, from its location, ticket type and price, and ticket that you bought. You can also set a new location, event and its ticket, and purchase ticket.


Instruction
---
Still not sure about how to use this server? Fear not. By following this instruction's steps, you can run and use this server on your pc. Let's get started !

_note: for a deeper understanding about the term used in this guide, you can google it yourself. Sorry for my limitations :(_

### Step 1: Preparation
Before starting, we should to install some program needed to run the server, that is:
1. Node & NPM. 
Regarding on your operating system, follow the installation steps on the official node website, https://nodejs.org/en/download/
_(note: beside NPM, you can use yarn too, but it's not covered in this guide, sorry :( )_

2. Npx. 
After Node & NPM installation, you can install npx from your terminal by type:
```
$ npm install -g npx
```
_(note: usually, we should install many package needed to run server that we build from scratch. But we will skip those steps by cloning this repository)_ 

3. Postman.
Follow the installation steps on the official Postman website, https://www.getpostman.com/downloads/
_(note: you can also use REST Client Extension in Visual Studio Code text editor)_

4. MySQL.
Here, I use MySQL for its RDBMS. Install and set MySQL (or something else that can handle .sql files) with following steps in the official website https://dev.mysql.com/downloads/installer/

### Step 2: Clone this repository
You can clone this repository by downloading the zip. 
1. Unzip the package
2. Then, open the folder using cmd/terminal
3. Type `npm install` in cmd/terminal, then press enter and wait until the installation progress end.

Now, you are ready to use this server.

### Step 3: Run the server
1. To use the server, first we need to run the server by typing `nodemon index` in cmd/terminal with the directory of this package folder.

2. Import the loket_gorry.sql file in the main folder to the database. 

3. Open Postman.
Postman are a GUI used for interacting with our server. For now, we can setting methods, request URL, and request body. 
In this server, there are two methods that we can use, _GET_ and _POST_. 
The main URL used for request URL is `localhost:8787` + relative path provided in this server. 
Then, for request body, you can use examples provided in folder "rest" for _POST_ method in post.rest file. You can see the list of end-point used in this server in table below. 
_(note: by using Visual Studio Code and REST Client Extension/Plugin, you can easily run GET and POST methods from file get.rest and post.rest. Also, you can get the full list of endpoint in this server)_

Endpoint | Relative Path | Method | Description
--- | --- | --- | ---
Create Event | */event/create* | POST | Endpoint to create new event 
Create Location | */location/create* | POST | Endpoint to create new location 
Create Ticket | */event/ticket/create* | POST | Endpoint to create new ticket type on one specific event 
Get Event | */event/get_info* | GET | Endpoint to retrieve event information, including location data and ticket data 
Purchase Ticket | */transaction/purchase* | POST | Endpoint to make a new purchase, customer data is sent via this API 
Transcation Detail | */transaction/get_info* | GET | Endpoint to retrieve transaction created using endpoint *Purchase Ticket* 

----

That's it. You have run a server and its database. Hopefully, this server and guide can be useful. 

_note: there may be something unclear or "what do you mean?!" moment. Don't worry, you're not alone. You can ask question to google and some community like stackoverflow.com_

#seeyouinthenextlevel
