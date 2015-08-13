StoryModal = React.createClass({
  render: function() {
      return (
      <div className="modal fade" id={createModalStoryId(this.props.story.id, false)} 
        tabIndex="-1" role="dialog">
        <div className="modal-dialog modal-lg" role="document">
          <div className="modal-content">
            <div className="modal-body">
              <span><strong>{this.props.story.name}</strong></span>
              <span className="story-id">{this.props.story.id}</span>
              {!this.props.story.estimate!=null && this.props.story.estimate > 0 ?
                <span className="story-points">{this.props.story.estimate} sp</span> :
                false}
                  <br/>
              {this.props.story.owners!= null && this.props.story.owners.length > 0 ?
                (this.props.story.owners.map(function(owner) {
                  return <img src={owner.image_path} width="200" height="200" />
                })) :
                false}
                <br/>
                <b>Description</b><br/>
                <span>{this.props.story.description}</span>
            </div>
          </div>
        </div>
      </div>
    );
  }
});