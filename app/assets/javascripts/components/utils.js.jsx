createModalStoryId = function(id, hex) {
  return (hex ? "#":"") + id + "-modal";
};

createMarkup = function(content) {
  return {__html: marked(content, {sanitize: true})}
}