package com.uservr.user

/**
 * Created by John on 9/30/15.
 */
class User {

    Long id
    Long version

    String username
    String password

    String name

    String toString() {
        "$username"
    }

    def constraints =
            {
                username(username:true)
                password(blank:false, password:true)

            }

}
