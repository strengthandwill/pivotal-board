createModalStoryId = function(id, hex) {
  return (hex ? "#":"") + id + "-modal";
};

createSubStoryId = function(id, subId, hex) {
  var newId = id + subId;
  if (hex) {
    return "#" + newId;
  } else {
    return parseInt(newId);
  }
};

createMarkup = function(content) {
  return {__html: marked(content, {sanitize: true})}
};

storyClassName = function(story) {
  return " " + story.story_type + " " + story.current_state;
};

changeBacklogColor = function(backlog, color) {
  backlog.find("> .panel-heading").css("background-color", color);
  backlog.find("> .panel-body").css("background-color", lightenDarkenColor(color, 50));
};

changeElementColor = function(element, color) {
  element.css("background-color", color);
};

lightenDarkenColor = function(color, amount) {
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
};