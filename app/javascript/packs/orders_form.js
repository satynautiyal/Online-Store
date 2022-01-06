//Change TotalAmount after of Product
changeTotalAmountProduct = function(quantity,price)
{
  let newPrice=price*quantity;
  $("#total_amount_div").html(newPrice.toFixed(2));
  $("#total_amount_hidden").val(newPrice.toFixed(2));
}

//Change TotalAmount after of Service
changeTotalAmountService = function(changedDuration,defaultDuration,defaultPrice) 
{
  let newPrice=defaultPrice/defaultDuration*changedDuration;
  $("#total_amount_div").html(newPrice.toFixed(2));
  $("#total_amount_hidden").val(newPrice.toFixed(2));
}

//Set start_time and end_time to hidden field of form and enable BuyNow button
setTime = function(startTime,endTime)
{
  $('#start_time').val(startTime);
  $('#end_time').val(endTime);
  $("#button_add_to_cart").attr("class","appearance-none w-28 bg-blue-600 text-gray-100 font-bold border border-gray-200 rounded-lg py-3 px-3 leading-tight hover:bg-blue-500 focus:opacity-70 focus:outline-none focus:border-gray-500");
  $("#button_buynow").attr("class","appearance-none w-28 bg-green-600 text-gray-100 font-bold border border-gray-200 rounded-lg py-3 px-3 leading-tight hover:bg-green-500 focus:opacity-70 focus:outline-none focus:border-gray-500");
}

          
  