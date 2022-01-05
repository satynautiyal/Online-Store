//To Close The UpdateServiceModal
$(".btnClose").on("click",function() {
    $("#update_product_service").hide();
})

//Update Product Quantity In Cart
update_quanatity = function(quantity,orderId,itemPrice)
{
    let newPrice=(quantity*itemPrice).toFixed(2)
    $("#amount"+orderId).html(newPrice);
    $.ajax({
        url: "/carts/update_qty",
        data: "quantity="+quantity+"&order_id="+orderId+"&amount="+newPrice,
        type: "post"
    })
}

//Global Variables
var defaultDuration;
var orderId;
var startTime;var final_startTime;
var endTime;var final_endTime;
var defaultPrice;
var orderableDuration;
var totalAmount;

//Show the PopUp to Change the Service Date Duration and Time
update_product_service_popup = function(order_id,date,default_duration,start_time,end_time,default_price,order_duration){
    orderId=order_id;
    defaultPrice=default_price;
    orderableDuration=order_duration;
    defaultDuration=default_duration;
    startTime=start_time;
    endTime=end_time;
    totalAmount=(defaultPrice/defaultDuration*orderableDuration).toFixed(2);
    $("#update_product_service").css("display","inline");
    $("#date_in_popup").val(date);
    $("#duration_in_popup").attr("step",defaultDuration);
    $("#duration_in_popup").val(orderableDuration);
    $.ajax({
        url: "../orders/time_slot",
        data: "id="+orderId+"&user_date="+date+"&duration="+defaultDuration+"&start_time="+start_time+"&end_time="+end_time+"&default_duration="+defaultDuration,
        type: "get",
        success: function (response) {
        }
    })
}

//Fetch the time slots from time_slots parital after changing date or duration
$("#date_in_popup, #duration_in_popup").on("change",function(){
    $("#date_in_popup").blur();
    let duration=$("#duration_in_popup").val();

    totalAmount=(defaultPrice/defaultDuration*duration).toFixed(2);
    $.ajax({
    url: "../orders/time_slot",
    data: "user_date="+$("#date_in_popup").val()+"&duration="+duration+"&start_time="+startTime+"&end_time="+endTime+"&default_duration="+defaultDuration,
    type: "get",
    success: function (response) {
    }
    })
})

//update product_service after clicking SaveButton in PopUp
update_product_service = function()
{ 
    date=$("#date_in_popup").val();
    duration=$("#duration_in_popup").val();
    $.ajax({
        url: "update_product_service",
        data: "order_id="+orderId+"&date="+date+"&duration="+duration+"&start_time="+final_startTime+"&end_time="+final_endTime+"&total_amount="+totalAmount+"&default_duration="+defaultDuration,
        type: "get",
        success: function (response) {
            location.reload();
        }
    })  
}

//To close the update_service popup
$("#update_product_service_close").on("click",function()
{
    $("#update_product_service").css("display","none");
})
//Set start_time and end_time to hidden field of form and enable BuyNow button
setTime = function(user_selected_start_time,user_selected_end_time) {
    final_startTime=user_selected_start_time;
    final_endTime=user_selected_end_time;
}

//Focus on Date If A User Click On Start_Time or End_time
first_select_date = function() {
    $("#date").focus();
}