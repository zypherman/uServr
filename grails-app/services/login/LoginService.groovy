package login

import com.uservr.web.Customer
import com.uservr.web.User
import grails.transaction.Transactional

@Transactional
class LoginService {

    /**
     * Register user account
     * Will only be able to be accessed by an admin
     * @param params
     * @return boolean if customer was found already
     * @return User if it creates a new user
     */
    def registerUser(Map params) {
        //Check if user is already present in system
        def user = User.findWhere(username: params['username'], password: params['password'])
        if (user) return false

        //TODO hash this password
        User.findOrSaveWhere(username: params['username'], password: params['password'], role: params['role'])
    }

    def registerCustomer(Map params) {
        //add customer to the session
        //Hash this shit too
        Customer.findOrSaveWhere(name: params['name'], pin: ['pin'])
    }
}
