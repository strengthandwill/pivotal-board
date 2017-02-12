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
      var storyId = this.props.story.id;
      return (
        <p>
        {this.props.story.owners.map(function(owner, i) {
          var key = parseInt(storyId + i);
          return <img src={owner.image_path} width="50" height="50" key={key} />
        })}
        </p>
      );
    } else {
      return false;
    }
  },
  render: function() {
    var panelId = this.props.story.id + "-panel";
    var modalId = "#" + this.props.story.id + "-modal";
    return (
      <div className="story-panel panel panel-default" data-toggle="modal" 
        data-target={modalId} id={panelId}>
        <div className={"panel-body " + storyClassName(this.props.story)}>
          <span><strong>{this.props.story.name}</strong></span><span> </span>
          <span className="story-id">{this.props.story.id}</span><span> </span>
          {this.renderStoryPoints()}&nbsp;
          <span className="story-started-time">{this.props.story.started_time} days</span>
          {this.renderOwnerImages()}
        </div>
      </div> 
    );
  }
});