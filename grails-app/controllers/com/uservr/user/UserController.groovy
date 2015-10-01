package com.uservr.user

import com.uservr.login.AuthorisationController
import grails.converters.JSON
import menu.MenuService

class UserController extends AuthorisationController {

    MenuService menuService

    //before we show the page lets check to see if their logged in, if not redirect them to log in
    def beforeInterceptor = [action: this.&checkUser, except: ['index']]

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
