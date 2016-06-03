Story = React.createClass({
  initStoryColor: function() {
    changeElementColor($(".feature"), this.props.settings.feature_color);
    changeElementColor($(".chore"),   this.props.settings.chore_color);
    changeElementColor($(".bug"),     this.props.settings.bug_color);
    changeElementColor($(".retro"),   this.props.settings.retro_color);
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