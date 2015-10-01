package com.uservr.customer

import grails.converters.JSON
import menu.MenuService

class CustomerController {

    MenuService menuService

    def index() {
        render view: 'index'
    }

    def drink() {
        def drinkViewModel = menuService.getAvailableDrinks();
        render view: 'drink', model: [drinkViewModel: JSON.use('deep') { raw(drinkViewModel as JSON)}]
    }

    def addItem() {
        render menuService.addItem(request.JSON.order)
    }

    def removeItem() {
        render menuService.removeItem(request.JSON.order)
    }

    def getOrder() {
        render JSON.use('deep') {raw(menuService.getOrder() as JSON)}
    }

    def sendOrder() {
        render menuService.sendOrder(request.JSON.order)
    }
}
