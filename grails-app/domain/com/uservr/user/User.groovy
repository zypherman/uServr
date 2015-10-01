package com.uservr.user

class User {

    Long id
    Long version

    String username
    String password

    String name

    String toString() {
        "$username"
    }

    static constraints = {
                username blank: false
                password blank: false
    }

}
