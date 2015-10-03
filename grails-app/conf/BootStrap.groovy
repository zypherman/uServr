import com.uservr.web.*

class BootStrap {

    def init = { servletContext ->
        Customer.findOrSaveWhere(username: "bill",password:"password", name:"Bill Buttlicker")
    }
    def destroy = {
    }
}
