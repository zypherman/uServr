package filters

class SecurityFilters {

    def filters = { //Set to check for all log in
        loginCheck(controller: '*', action: '*') {
            before = {
                if (!session.customer && (!controllerName.equals('login'))) {
                    redirect(controller: 'login', action: 'login')
                    return false
                }
            }
        }
    }
}
