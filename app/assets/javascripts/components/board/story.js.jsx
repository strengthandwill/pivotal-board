Story = React.createClass({
  initStoryColor: function() {
    changeStoryColor($(".feature"), this.props.colors.feature);
    changeStoryColor($(".chore"),   this.props.colors.chore);
    changeStoryColor($(".bug"),     this.props.colors.bug);
    changeStoryColor($(".retro"),   this.props.colors.retro);
  },
  componentDidMount: function() {
    this.initStoryColor();
  },
  render: function() {
    return(
      <div className="story" key={parseInt(this.props.story.id)}>
        <StoryPanel story={this.props.story} />
        <StoryModal story={this.props.story} />
      </div>
    );
  }
});