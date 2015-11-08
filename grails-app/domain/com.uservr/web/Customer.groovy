package com.uservr.web

class Customer {

    Long id
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
