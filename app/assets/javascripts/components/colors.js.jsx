initAdminColors = function() {
  var color = $("#settings").data("color");
  changeBackgroundColor($("#unstarted"), colors.unstarted);
  changeBackgroundColor($("#started"),   colors.started);
  changeBackgroundColor($("#finished"),  colors.finished);
  changeBackgroundColor($("#delivered"), colors.delivered);
  changeBackgroundColor($("#impeded"),   colors.impeded);
  changeBackgroundColor($("#accepted"),  colors.accepted);
  changeBackgroundColor($("#feature"),   colors.feature);
  changeBackgroundColor($("#chore"),     colors.chore);
  changeBackgroundColor($("#bug"),       colors.bug);
  changeBackgroundColor($("#retro"),     colors.retro);
};