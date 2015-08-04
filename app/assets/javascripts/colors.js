function initBoardColors() {
  var color = $("#settings").data("color");
  changeBacklogColor($("#unstarted"), color.unstarted);
  changeBacklogColor($("#started"),   color.started);
  changeBacklogColor($("#finished"),  color.finished);
  changeBacklogColor($("#delivered"), color.delivered);
  changeBacklogColor($("#impeded"),   color.impeded);
  changeBacklogColor($("#accepted"),  color.accepted);
  changeBackgroundColor($(".feature"),     color.feature);
  changeBackgroundColor($(".chore"),       color.chore);
  changeBackgroundColor($(".bug"),         color.bug);
  changeBackgroundColor($(".retro"),       color.retro);
}

function initAdminColors() {
  var color = $("#settings").data("color");
  changeBackgroundColor($("#unstarted"), color.unstarted);
  changeBackgroundColor($("#started"),   color.started);
  changeBackgroundColor($("#finished"),  color.finished);
  changeBackgroundColor($("#delivered"), color.delivered);
  changeBackgroundColor($("#impeded"),   color.impeded);
  changeBackgroundColor($("#accepted"),  color.accepted);
  changeBackgroundColor($("#feature"),     color.feature);
  changeBackgroundColor($("#chore"),       color.chore);
  changeBackgroundColor($("#bug"),         color.bug);
  changeBackgroundColor($("#retro"),       color.retro);
}

function changeBacklogColor(backlog, color) {
  backlog.find("> .panel-heading").css("background-color", color);
  backlog.find("> .panel-body").css("background-color", lightenDarkenColor(color, 50));
}

function changeBackgroundColor(story, color) {
  story.css("background-color", color)
}

function lightenDarkenColor (color, amount) {
  var usePound = false;
  if (color[0] == "#") {
    color = color.slice(1);
    usePound = true;
  }
  var num = parseInt(color, 16);
  var r = (num >> 16) + amount;
  if (r > 255) {
    r = 255;
  } else if (r < 0) {
    r = 0;
  }
  var b = ((num >> 8) & 0x00FF) + amount;
  if (b > 255) {
    b = 255;
  } else if (b < 0) {
    b = 0;
  }
  var g = (num & 0x0000FF) + amount;
  if (g > 255) {
    g = 255;
  } else if (g < 0) {
    g = 0;
  }
  return (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16);
}