package payment

import java.time.LocalDate

class Payment implements Serializable {

    long cardNumber
    String type
    LocalDate expirationDate
    int cvv
}