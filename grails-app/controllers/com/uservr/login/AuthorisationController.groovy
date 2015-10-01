package com.uservr.login

import com.uservr.user.User

/*
Each class that wishes to use authorization will need to extend this controller
 */
class AuthorisationController {

    def index() {}

    //Adds the user to the session object so they are logged in
    def login = {
    }

    //Register user
    def register = {

    }

    def doLogin = {
        def user = User.findWhere(email: params['email'], password: params['password'])
        session.user = user
        if (user) redirect(controller: 'user', action: 'index')
        else redirect(controller: 'user', action: 'login')
    }

    //Checks if the user is logged into the current session
    def checkUser() {
        if(!session.user) {
            //User not logged in
            redirect(controller: 'user', action: 'login')
            return false
        }
    }

    def logout = {
        session.user = null;
        redirect(action: 'login')
    }
}
