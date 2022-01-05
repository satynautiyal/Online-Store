
 redirectToPaymentCart=function(amount){
    $.ajax({
      type: "get",
      data: "name=cart&quantity=1&amount="+amount+"&cart=true",
      url: "../payment/create_payment",
      success: function(response) {
      }
    })
  }