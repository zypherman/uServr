import com.uservr.user.*;

class BootStrap {

    def init = { servletContext ->
        new User(username: "eg@eg.com",password:"password").save()
    }
    def destroy = {
    }
}
