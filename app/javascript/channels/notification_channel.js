import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if(data.for_user=="admin")
    {
      $("#notification-admin-alert-area").css("display","inline")
      $("#notification-admin-alert-icon").html(data.icon);
      $("#notification-admin-alert-title").html(data.title);
      $("#notification-admin-alert-content").html(data.content);
    }
    if(data.for_user=="buyer")
    {
      $("#notification-buyer-alert-area").css("display","inline")
      $("#notification-buyer-alert-icon").html(data.icon);
      $("notification-buyer-alert-title").html(data.title);
      $("notification-buyer-alert-content").html(data.content);
    }
    if(data.for_user=="seller")
    {
      $("#notification-seller-alert-area").css("display","inline")
      $("#notification-seller-alert-icon").html(data.icon);
      $("notification-seller-alert-title").html(data.title);
      $("notification-seller-alert-content").html(data.content);
    }
    if(data.for_user=="specific_user")
    {
      $("#notification-specific_user-alert-area").css("display","inline");
      $("#notification-user"+data.current_user+"-alert-icon").html(data.icon);
      $("#notification-user"+data.current_user+"-alert-title").html(data.title);
      $("#notification-user"+data.current_user+"-alert-content").html(data.content);
    }
    if(data.for_user=="all")
    {
      $("#notification-all-alert-area").css("display","inline");
      $("#notification-all-alert-icon").html(data.icon);
      $("#notification-all-alert-title").html(data.title);
      $("#notification-all-alert-content").html(data.content);
    }
  }
});
