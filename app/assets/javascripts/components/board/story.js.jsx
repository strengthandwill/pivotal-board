Story = React.createClass({
  render: function() {
    return(
      <div className="story">
        <StoryPanel story={this.props.story} />
        <StoryModal story={this.props.story} />
      </div>
    );
  }
});