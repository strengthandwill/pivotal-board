Story = React.createClass({
  render: function() {
    //var storyClassName = " " + this.props.story.story_type + " " + this.props.story.current_state;
    return(
      <div className="story">
        <StoryPanel story={this.props.story} />
        <StoryModal story={this.props.story} />
      </div>
    );
  }
});