package com.uservr.login

import groovy.json.JsonOutput

class LoginController {

    def index() {
        render view: 'index'
    }

    def login(LoginCommand loginCommand) {
        if (loginCommand.hasErrors()) {
            render JsonOutput.toJson([message: 'Invalid Pin'])
            return
        }

        def bar = '1111'
        def kitchen = '2222'
        def manager = '3333'

        switch (loginCommand.loginPin) {
            case bar: session.setAttribute('bar', true)
                String from = session.getAttribute('from')
                if (from.equals('bar')) {
                    session.removeAttribute('from')
                    render JsonOutput.toJson([from: '/bar/index/'])
                } else {
                    render JsonOutput.toJson([message: 'Invalid Access'])
                }
                break;
            case kitchen: session.setAttribute('kitchen', true)
                String from = session.getAttribute('from')
                if (from.equals('kitchen')) {
                    session.removeAttribute('from')
                    render JsonOutput.toJson([from: '/kitchen/index/'])
                } else {
                    render JsonOutput.toJson([message: 'Invalid Access'])
                }
                break;
            case manager: session.setAttribute('manager', true)
                String from = session.getAttribute('from')
                session.removeAttribute('from')
                render JsonOutput.toJson([from: '/' + from + '/index/'])
                break;
        }
    }

    /**
     * Remove any session data and then redirect us to the log in page
     */
    def logout() {
        session.invalidate()
        render true
    }

    def logout2() {
        session.invalidate()
        redirect uri: '/'
    }
}

class LoginCommand {
    String loginPin

    static constraints = {
        loginPin(blank: false, validator: { val ->
            val.matches(/^[0-9]*$/) && val.length() == 4
        })
    }
}
