package com.uservr.customer

import grails.converters.JSON
import menu.MenuService
import payment.PaymentService

class CustomerController {

    MenuService menuService
    PaymentService paymentService

    def index() {
        render view: 'index', model: [menuItems: menuService.getAvailableDrinks()]
    }

    def drink() {
        def drinkViewModel = menuService.getAvailableDrinks();
        render view: 'drink', model: [drinkViewModel: JSON.use('deep') { raw(drinkViewModel as JSON) }]
    }

    def food() {
        render view: 'index'
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
        render menuService.sendOrder(request.JSON.order)
    }

    def welcome() {
        render view: 'welcome', model: [menuItems: menuService.getAvailableDrinks()]
    }

    //Tie method of payment to their account
    def addMethodOfPayment() {

    }

}
