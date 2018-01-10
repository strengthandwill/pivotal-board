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
    var show_started_time = this.props.show_started_time;
    return(
      <div className="story" key={parseInt(this.props.story.id)}>
        <StoryPanel story={this.props.story} show_started_time={show_started_time} owner_image={this.props.owner_image} />
        <StoryModal story={this.props.story} show_started_time={show_started_time} owner_image={this.props.owner_image} />
      </div>
    );
  }
});