import com.uservr.web.*

class BootStrap {

    def init = { servletContext ->
        //new Customer(username: "bob@bsb.com",password:"password", name:"Bob Buttlicker").save(failOnError: true)
        Customer.findOrSaveWhere(username: "bill",password:"password", name:"Bill Buttlicker")
    }
    def destroy = {
    }
}
