package filters

class SecurityFilters {

    def filters = { //Set to check for all log in
        loginCheck(controller: '*', action: '*') {
            before = {
                //turn off authentication
                session.customer = "bob"
                session.name = "Bob Buttlicker"

                if (!session.customer && (!controllerName.equals('login'))) {
                    redirect(controller: 'login', action: 'login')
                    return false
                }
            }
        }
    }
}
