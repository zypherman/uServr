package customer
import address.Address
import com.uservr.customer.RegisterCustomerCommand
import payment.Payment

import javax.servlet.http.HttpSession
import java.time.LocalDate

class CustomerService {

    int id = 1

    def getId() {
        id++
    }

    CustomerDTO getCustomer(HttpSession session) {
        def customer = session.getAttribute('customer')
        CustomerDTO customerDTO = new CustomerDTO()
        if (customer){
            customerDTO.name = customer.name
            customerDTO.id = customer.id
            customerDTO.pin = customer.pin
            customerDTO.address = customer.address
            customerDTO.payment = customer.payment
        }
        customerDTO
    }

    boolean createNewCustomer(RegisterCustomerCommand registerCustomerCommand, HttpSession session) {
        Address address = new Address(
                street: registerCustomerCommand.street,
                city: registerCustomerCommand.city,
                state: registerCustomerCommand.state,
                zip: registerCustomerCommand.zip
        )
        Payment payment = new Payment(
                cardNumber: Long.parseLong(registerCustomerCommand.credit),
                expirationDate: getDate(registerCustomerCommand.exp),
                cvv: getCvv(registerCustomerCommand.cvv)
        )
        CustomerDTO customer = new CustomerDTO(
                name: registerCustomerCommand.name,
                id: getId(),
                pin: registerCustomerCommand.pin,
                address: address,
                payment: payment
        )
        session.setAttribute('customer', customer)
        true
    }

    LocalDate getDate(String date) {
        try {
            return LocalDate.parse(date)
        } catch(ignore) {
            println('unable to parse exp')
            return LocalDate.now()
        }
    }

    int getCvv(String cvv) {
        try {
            return Integer.parseInt(cvv)
        } catch (ignore) {
            println('unable to parse cvv')
            return 123
        }
    }
}
