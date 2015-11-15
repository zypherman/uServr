package filters

class SecurityFilters {

    def filters = { //Set to check for all log in
        loginCheck(controller: '*', action: '*') {
            before = {
                //turn off authentication
                session.admin = "bob"
                session.name = "Bob Buttlicker"

                if (!session.admin && (!controllerName.equals('login'))) {
                    redirect(controller: 'login', action: 'login')
                    return false
                }
            }
        }
    }
}
