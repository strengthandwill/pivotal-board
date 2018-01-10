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
      var storyId = this.props.story.id;
      return (
        <p>
        {this.props.story.owners.map(function(owner, i) {
          var key = parseInt(storyId + i);
          return <img src={owner.image_path} width="200" height="200" key={key} />
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
  renderURL: function() {
    if (this.props.story.description!=null) {
      return (
        <p>
          <b>URL</b>
          <br/>
          <a href={this.props.story.url}>{this.props.story.url}</a>
        </p>
      );
    } else {
      return false;
    }
  },
  renderStartedTime: function() {
    var show_started_time = this.props.show_started_time;
    if (show_started_time) {
      return <span className="story-started-time">{this.props.story.started_time} days</span>;
    } else {
      return false;
    }
  },
  render: function() {
    var modelId = this.props.story.id + "-modal";
    return (
      <div className="modal fade" id={modelId}>
        <div className="modal-dialog modal-lg">
          <div className="modal-content">
            <div className={"modal-body" + storyClassName(this.props.story)}>
              <span><strong>{this.props.story.name}</strong></span><span> </span>
              <span className="story-id">{this.props.story.id}</span><span> </span>
              {this.renderStoryPoints()}&nbsp;
              {this.renderStartedTime()}
              {this.renderOwnerImages()}
              {this.renderDescription()}
              {this.renderURL()}
            </div>
          </div>
        </div>
      </div>
    );
  }
});