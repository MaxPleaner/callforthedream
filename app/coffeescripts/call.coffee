Twilio.Device.ready = (device) ->
  $("#log").text("Ready");

Twilio.Device.error = (error) ->
  $("#log").text("Error: " + error.message);

Twilio.Device.connect = (conn) ->
  $("#log").text("Successfully established call");


call = ->
  Twilio.Device.connect();