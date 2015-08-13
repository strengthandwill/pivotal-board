StoryModal = React.createClass({
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
          return <img src={owner.image_path} width="200" height="200" />
        })}
        </p>
      );
    } else {
      return false;
    }
  },
  renderDescription: function() {
    if (this.props.story.description!=null) {
      return (
        <p>
          <b>Description</b>
          <br/>
          <div dangerouslySetInnerHTML={createMarkup(this.props.story.description)} />
        </p>
      );
    } else {
      return false;
    }
  },
  render: function() {
    return (
      <div className="modal fade" id={createModalStoryId(this.props.story.id, false)} 
        tabIndex="-1" role="dialog">
        <div className="modal-dialog modal-lg" role="document">
          <div className="modal-content">
            <div className="modal-body">
              <span><strong>{this.props.story.name}</strong></span>
              <span className="story-id">{this.props.story.id}</span>
              {this.renderStoryPoints()}
              {this.renderOwnerImages()}
              {this.renderDescription()}
            </div>
          </div>
        </div>
      </div>
    );
  }
});