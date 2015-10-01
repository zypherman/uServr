package com.uservr.login

import com.uservr.web.*

class LoginController {

    def index() {}

    //Adds the customer to the session object so they are logged in
    def login = {
    }

    //Register customer
    def register = {
    }

    def doLogin = {
        def customer = Customer.findWhere(username: params['username'], password: params['password'])

        //If we found a customer then do some stuff
        if (customer) {
            session.customer = customer
            session.name = customer.name
            render (uri: "customer/index")
            return
        }
        else { //Otherwise flash a message that you were not found
            flash.error = "Customer not found, please try again or register" //FixMe put this in the messages.properties
            return
        }
    }

    def logout = {
        session.customer = null;
        session.name = null;
        redirect(action: 'login')
    }
}
