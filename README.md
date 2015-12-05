# uServr
Restaurant food ordering system 

Build Status 
[![Build Status](https://travis-ci.org/zypherman/uServr.svg)](https://travis-ci.org/zypherman/uServr)

This application utilizes:
* Grails 2.4.5
* Java 8
* Postgresql

We recommend Intellij IDE to develop with. 
Install grails and groovy with the GVM manager:
http://sdkman.io/

uServr is a resturant food ordering system. 
Multiple interfaces can be accessed on the system. 
Customer
Kitchen
Bar
Manager

Customer Interface is where the customer interacts with the menu and their orders. 
They can see menu broken down into different categories.
They can add items to their order from any page as well as place their order when they are satisfied. 
Customer enters in their information and billing information. Pin protects them on repeat order. 

Kitchen interface shows all current orders. They are able to view details about them as well as process them and mark them as completed. 

Bar interface is just like kitchen but only for drinks. 

Manager interface shows a history of sales for each item and how much revenue it has generated. 
They can also edit the items on the menue as well as add more. 
