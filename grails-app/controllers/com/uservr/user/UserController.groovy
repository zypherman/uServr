package com.uservr.user

class UserController {

    def index() {
        render view: 'index'
    }

    def login() {
        if(params.username == "admin" && params.password == "pass"){
            flash.message = "login good"
            session.user = "admin"
        } else {
            flash.message = "login failed"
        }
        redirect(action: 'index')
    }

    def logout = {
        session.user = null
        redirect(action: 'index')
    }
}
