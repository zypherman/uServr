package com.uservr.login

import com.uservr.web.*

class LoginController {

    def index() {}

    //Register customer
    def register() {
        Customer.findOrSaveWhere(username: params['username'], password: params['password'], name: params['username'])
        forward(controller: 'login', action: 'login', params: params)
    }

    def login = {
        def customer = Customer.findWhere(username: params['username'], password: params['password'])

        //If we found a customer then do some stuff
        if (customer) {
            session.customer = customer
            session.name = customer.name
            forward(controller: 'customer', action: 'index')
            return
        } else { //Otherwise flash a message that you were not found
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
