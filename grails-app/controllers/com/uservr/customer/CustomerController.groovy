package com.uservr.customer

import customer.CustomerDTO
import customer.CustomerService
import grails.converters.JSON
import menu.MenuService
import payment.PaymentService

class CustomerController {

    MenuService menuService
    CustomerService customerService
    PaymentService paymentService

    def index() {
        render view: 'index', model: [menuItems: menuService.getAvailableDrinks()]
    }

    def drink() {
        def drinkViewModel = menuService.getAvailableDrinks();
        render view: 'drink', model: [drinkViewModel: JSON.use('deep') { raw(drinkViewModel as JSON) }]
    }

    def food() {
        def foodViewModel = menuService.getAvailableFood();
        render view: 'food', model: [foodViewModel: JSON.use('deep') { raw(foodViewModel as JSON) }]
    }

    def addItem() {
        render menuService.addItem(request.JSON.order)
    }

    def removeItem() {
        render menuService.removeItem(request.JSON.order)
    }

    def getOrder() {
        render JSON.use('deep') { raw(menuService.getOrder() as JSON) }
    }

    def sendOrder() {
       // paymentService.processPayment(session?.customer)
        CustomerDTO customerDTO = customerService.getCustomer(session)
        render menuService.sendOrder(request.JSON.order, customerDTO.id)
    }

    def registerCustomer(RegisterCustomerCommand registerCustomerCommand) {
        render customerService.createNewCustomer(registerCustomerCommand, session)
    }

    def welcome() {
        render view: 'welcome', model: [menuItems: menuService.getAvailableDrinks()]
    }

    //Tie method of payment to their account
    def addMethodOfPayment() {

    }

}

class RegisterCustomerCommand {
    String name
    String street
    String city
    String state
    String zip
    String credit
    String exp
    String cvv
    String pin
    String pin2
}