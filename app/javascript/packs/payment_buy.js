
 redirectToPayment=function(id,name,price){
    if($("#quantity").val()!=undefined)
    {
      var quantity=$("#quantity").val();
      var amount =price;
      var orderable_type="ProductVariant";
    }
    else
    {
      if ($("#button_buynow").hasClass("cursor-not-allowed"))
      {
        return;
      }
      else
      {
        var quantity=1;
        var duration=$("#duration").val();
        var start_time=$("#start_time").val();
        var end_time=$("#end_time").val();
        var amount=$("#total_amount_hidden").val();
        var orderable_type="ProductService";
        var date=$("#date").val();
      }
    }
    $.ajax({
      type: "get",
      data: "id="+id+"&name="+name+"&quantity="+quantity+"&duration="+duration+"&start_time="+start_time+"&end_time="+end_time+"&amount="+amount+"&orderable_type="+orderable_type+"&date="+date,
      url: "../payment/create_payment",
      success: function(response) {
      }
    })
  }