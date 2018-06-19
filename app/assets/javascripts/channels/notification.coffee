App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log("WEBSOCKET CLIENT CONNECTED ON NotificationChannel")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("DISCONNECTED")

  received: (data) ->
    
    console.log(data)

    alert data.message
    $.notify("Ok");
    if $('#librariers_dashboard').length > 0
      $('#borrowed_books').html(data.borrowed_books)