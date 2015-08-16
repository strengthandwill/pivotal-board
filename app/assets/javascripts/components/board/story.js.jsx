Story = React.createClass({
  initStoryColor: function() {
    changeStoryColor($(".feature"), this.props.settings.feature_color);
    changeStoryColor($(".chore"),   this.props.settings.chore_color);
    changeStoryColor($(".bug"),     this.props.settings.bug_color);
    changeStoryColor($(".retro"),   this.props.settings.retro_color);
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