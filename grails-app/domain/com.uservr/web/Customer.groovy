package com.uservr.web

class Customer {

    int id
    Long version
    String name
    String pin

    String toString() {
        "$name"
    }

    static constraints = {
        name blank: false
        pin blank: false
    }

}
