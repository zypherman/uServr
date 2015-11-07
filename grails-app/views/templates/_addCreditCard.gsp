<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>


<div id="addPaymentModal" class="modal modal-lg fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Method Of Payment</h4>
            </div>

            <div class="modal-body">
                <!-- CREDIT CARD FORM STARTS HERE -->
                <div class="panel panel-default credit-card-box">
                    <div class="panel-heading display-table">
                        <div class="row display-tr">

                            <div class="display-td">
                                <g:img class="img-responsive" dir="images" file="acceptedCards.png"/>
                                <p><strong>Accepted Card Types</strong></p>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body">
                        <form role="form" id="payment-form">
                            <g:form action="addMethodOfPayment" method="put" id="payment-form"/>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="cardNumber"><strong>Card Number</strong></label>

                                        <div class="input-group">
                                            <input
                                                    type="tel"
                                                    class="form-control"
                                                    name="cardNumber"
                                                    id="cardNumber"
                                                    placeholder="Valid Card Number"
                                                    autocomplete="cc-number"
                                                    required autofocus/>
                                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-7 col-md-7">
                                    <div class="form-group">
                                        <label for="cardExpiry"><span class="hidden-xs"><strong>Expiration Date</strong>
                                        </span><span
                                                class="visible-xs-inline">EXP</span> DATE</label>
                                        <input
                                                type="tel"
                                                class="form-control"
                                                name="cardExpiry"
                                                id="cardExpiry"
                                                placeholder="MM / YY"
                                                autocomplete="cc-exp"
                                                required/>
                                    </div>
                                </div>

                                <div class="col-xs-5 col-md-5 pull-right">
                                    <div class="form-group">
                                        <label for="cardCVC">CV CODE</label>
                                        <input
                                                type="tel"
                                                class="form-control"
                                                name="cardCVC"
                                                id="cardCVC"
                                                placeholder="CVC"
                                                autocomplete="cc-csc"
                                                required/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <button class="btn btn-success btn-lg btn-block"
                                            type="submit" data-bind="click: sendOrder">Add Card To Account</button>
                                </div>
                            </div>

                            <div class="row" style="display:none;">
                                <div class="col-xs-12">
                                    <p class="payment-errors"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- CREDIT CARD FORM ENDS HERE -->
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>




%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<!-- You can make it whatever width you want. I'm making it full width--}%
%{--on <= small devices and 4/12 page width on >= medium devices -->--}%
%{--<div class="col-xs-12 col-md-4">--}%

%{--</div>--}%

%{--</div>--}%
%{--</div>--}%