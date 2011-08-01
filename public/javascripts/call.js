/* DO NOT MODIFY. This file was compiled Tue, 26 Jul 2011 23:13:00 GMT from
 * /Work/congressconnect/app/coffeescripts/call.coffee
 */

var call;
Twilio.Device.ready = function(device) {
  return $("#log").text("Ready");
};
Twilio.Device.error = function(error) {
  return $("#log").text("Error: " + error.message);
};
Twilio.Device.connect = function(conn) {
  return $("#log").text("Successfully established call");
};
call = function() {
  return Twilio.Device.connect();
};