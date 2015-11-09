package com.uservr.web

class User {

    Long id
    Long version

    String name
    String role

    String username
    String password

    String toString() {
        "$username"
    }

    static constraints = {
        username blank: false
        password blank: false
        role blank: false
    }

}
