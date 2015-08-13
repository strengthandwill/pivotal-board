StoryPanel = React.createClass({
  render: function() {
    return (
      <div className="story-panel panel panel-default" data-toggle="modal" 
        data-target={createModalStoryId(this.props.story.id, true)}>
        <div className="panel-body">
          <span><strong>{this.props.story.name}</strong></span>
          <span className="story-id">{this.props.story.id}</span>
          {!this.props.story.estimate!=null && this.props.story.estimate > 0 ?
            <span className="story-points">{this.props.story.estimate} sp</span> :
            false}
          <br/>
          {this.props.story.owners!= null && this.props.story.owners.length > 0 ?
            (this.props.story.owners.map(function(owner) {
              return <img src={owner.image_path} width="50" height="50" />
            })) :
            false}
        </div>
      </div> 
    );
  }
});