package com.uservr.web

class Customer {

    Long id
    Long version

    String name

    String username
    String password

    String toString() {
        "$username"
    }

    static constraints = {
        username blank: false
        password blank: false
    }

}
