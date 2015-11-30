package com.uservr.customer
import customer.CustomerDTO
import customer.CustomerService
import grails.converters.JSON
import groovy.json.JsonOutput
import menu.MenuService

class CustomerController {

    MenuService menuService
    CustomerService customerService

    def index() {
        render view: 'index', model: [featuredFood: menuService.featuredFood, featuredDrinks: menuService.featuredDrinks]
    }

    def drink() {
        def drinkViewModel = menuService.drinks
        render view: 'drink', model: [drinkViewModel: JSON.use('deep') { raw(drinkViewModel as JSON) }]
    }

    def food() {
        def foodViewModel = menuService.food
        render view: 'food', model: [foodViewModel: JSON.use('deep') { raw(foodViewModel as JSON) }]
    }

    def itemDetail() {
        def detail = [detail:  menuService.getFeaturedItem(params.name)]
        render view: 'itemDetail', model: [detail: JSON.use('deep') { raw(detail as JSON) }]
    }

    def addItem() {
        render menuService.addItem(request.JSON.order)
    }

    def removeItem() {
        render menuService.removeItem(request.JSON.order)
    }

    def removeAllItems() {
        render menuService.removeAllItems()
    }

    def getOrder() {
        render JSON.use('deep') { raw(menuService.getOrder() as JSON) }
    }

    def startPage() {
        render view: 'startPage'
    }

    def sendOrder() {
        CustomerDTO customerDTO = customerService.getCustomer(session)
        render menuService.sendOrder(request.JSON.order, customerDTO.id)
    }

    def registerCustomer(RegisterCustomerCommand registerCustomerCommand) {
        render customerService.createNewCustomer(registerCustomerCommand, session)
    }

    def repeatCustomer(RepeatCustomerCommand repeatCustomerCommand) {
        CustomerDTO customerDTO = customerService.getCustomer(session)
        if (repeatCustomerCommand.hasErrors() || !customerService.validRepeat(repeatCustomerCommand, customerDTO)){
            render JsonOutput.toJson([message: 'Order Did Not Send. Try entering your pin and last 4 digits of your credit card again. If you have forgotten this information, logout and register again.'])
            return
        }

        render true
    }

    def welcome() {
        render view: 'welcome', model: [featuredFood: menuService.featuredFood, featuredDrinks: menuService.featuredDrinks]
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
    String expMonth
    String expYear
    String cvv
    String pin
    String pin2
}

class RepeatCustomerCommand {
    String repeatPin
    String lastFour

    static constraints = {
        repeatPin(blank: false, validator: { val ->
            val.matches(/^[0-9]*$/) && val.length() == 4
        })
        lastFour(blank: false, validator: { val ->
            val.matches(/^[0-9]*$/) && val.length() == 4
        })
    }
}