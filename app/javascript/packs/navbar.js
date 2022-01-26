//Notification
const { ajax } = require("jquery");

$( document ).ready(function(){

    $("#button-notification").hover(function()
    {
        $("#notification-drop-down").css("display","inline");
    },
    function()
    {
        $("#notification-drop-down").css("display","none"); 
    })

    $("#notification-drop-down").hover(function()
    {
        $("#notification-drop-down").css("display","inline");
    },
    function()
    {
        $("#notification-drop-down").css("display","none");
    })

    readed=function(notificationId,userId){
        $.ajax({
            type: 'get',
            data: "notification_id="+notificationId+"&user_id="+userId,
            url: "../after_readed",
            success: function(){
            }
        })
    }

    //Wishlist
    
    $("#button-wishlist").hover(function()
    {
        $("#wishlist-drop-down").css("display","inline");
    },
    function()
    {
        $("#wishlist-drop-down").css("display","none"); 
    })

    $("#wishlist-drop-down").hover(function()
    {
        $("#wishlist-drop-down").css("display","inline");
    },
    function()
    {
        $("#wishlist-drop-down").css("display","none");
    })

    //Disable search button if text-field is empty
    $("#search-text").on("change",function()
    {
        if($("#search-text").val() != "" )
        {
            $("#disabled-search-button").css("display","none");
            $("#search-button").css("display","inline");
        }
    })
    if( $("#search-text").val() != "")
    {
        $("#disabled-search-button").css("display","none");
        $("#search-button").css("display","inline");
    }
    else
    {
        $("#disabled-search-button").css("display","inline");
        $("#search-button").css("display","nonex");
    }
})

$(document).on('click', function(e) {
    var container = $("#welcome-dropdown-button");
    if ($(e.target).closest(container).length)
    {
        $("#welcome-dropdown-items").css("display","block");
    }
    else
    {
        $("#welcome-dropdown-items").css("display","none");
    }
});
