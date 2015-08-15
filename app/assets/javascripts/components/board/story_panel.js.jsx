StoryPanel = React.createClass({
  renderStoryPoints: function() {
    if (!this.props.story.estimate!=null && this.props.story.estimate > 0) {
      return <span className="story-points">{this.props.story.estimate} sp</span>;
    } else {
      return false;
    }
  },
  renderOwnerImages: function() {
    if (this.props.story.owners!= null && this.props.story.owners.length > 0) {
      return (
        <p>
        {this.props.story.owners.map(function(owner) {
          return <img src={owner.image_path} width="50" height="50" />
        })}
        </p>
      );
    } else {
      return false;
    }
  },
  render: function() {
    return (
      <div className="story-panel panel panel-default" data-toggle="modal" 
        data-target={createModalStoryId(this.props.story.id, true)}>
        <div className={"panel-body " + storyClassName(this.props.story)}>
          <span><strong>{this.props.story.name}</strong></span>
          <span className="story-id">{this.props.story.id}</span>
          {this.renderStoryPoints()}
          {this.renderOwnerImages()}
        </div>
      </div> 
    );
  }
});