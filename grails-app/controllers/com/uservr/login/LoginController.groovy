package com.uservr.login

import com.uservr.web.*
import login.LoginService

class LoginController {

    LoginService loginService

    def index() {}

    //Register user view render
    def registerUser() {
        render view: 'register'
    }

    /**
     * Register customer for the session
     * Will keep all customer data in the session object
     * Not sure what to do with payment stuff yet
     * Might have payment hold that data and have it hashed or somethign??
     * TODO figure that out
     */
    def registerCustomer() {
        session["customer"] = loginService.registerCustomer(params)
        session["name"] = session?.customer?.name
        forward(controller: 'customer', action: 'index')
        //Add Payment to their account
        //Once they pay final bill everything is wiped away
    }

    //Register the customer and redirect them to the next page
    def register() {

        if (!loginService.registerUser(params)) {
            flash.message = message(code: "login.userfound.error")
        } else {
            User.findOrSaveWhere(username: params['username'], password: params['password'], name: params['username'])
        }
        //TODO change to where this page needs to go
        //Might have to redirect to central employee location and then redirect based on filter
       // forward(controller: 'customer', action: 'index')
    }

    /**
     * Checks the entered in data against the current users
     * Adds the user to the session data if found
     * Otherwise if throws an error
     * No role checking here that is up to the filter
     */
    def login = {
        def user = User.findWhere(username: params['username'], password: params['password'])

        //If customer is found add them to the session info
        if (user) {
            session["user"] = user
            session["name"] = user?.name

            forward(controller: 'customer', action: 'index')
            return

        } else {
            flash.error = message(code: 'user.notfound.error')
            return
        }
    }

    /**
     * Remove any session data and then redirect us to the log in page
     */
    def logout = {
        session.invalidate()
        redirect(action: 'login')
    }
}
