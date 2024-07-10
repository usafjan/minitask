# minitask
This mini project include MS SQL script and server script files.
Server Side
Server side are written in asp.net C# with MVC5  , ADO.net are used for database connectivity.
Files details are following 
View
Index : list all message details from Database
Create : have a web form for message submit
Controller
Message : have two method  
index responsible for message listing 
Create responsible for file upload and call save model
Model 
Message model contain db logic for Message table

Class
MessageDBHandle :  responsible for ADO.net Operations
SQL :
Sql sercipt have one table message and three store procedure for saving record , select and select count.
thanks