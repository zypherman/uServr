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
            customerDTO.firstName = customer.firstName
            customerDTO.fullName = customer.fullName
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
                expirationDate: getDate(registerCustomerCommand.expMonth, registerCustomerCommand.expYear),
                cvv: getCvv(registerCustomerCommand.cvv)
        )
        def first = registerCustomerCommand.name.split(' ')[0]
        CustomerDTO customer = new CustomerDTO(
                firstName: first,
                fullName: registerCustomerCommand.name,
                id: getId(),
                pin: registerCustomerCommand.pin,
                address: address,
                payment: payment
        )
        session.setAttribute('customer', customer)
        true
    }

    LocalDate getDate(String month, String year) {
        try {
            return LocalDate.parse(year + '-' + month + '-01')
        } catch(ignore) {
            return LocalDate.now()
        }
    }

    int getCvv(String cvv) {
        try {
            return Integer.parseInt(cvv)
        } catch (ignore) {
            return 123
        }
    }
}
