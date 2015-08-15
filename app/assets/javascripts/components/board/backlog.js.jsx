var Backlog = React.createClass({
  render: function() {
    return (
      <div id={this.props.id} className="backlog panel panel-default col-md-2">
        <div className="panel-heading">
          <span>{this.props.name}</span>
          <span className="pull-right">{this.props.story_points}</span>
        </div>
        <div className="panel-body">
          {this.props.stories != null && this.props.stories.map(function(story) {
            return <Story story={story} />;
          })}
        </div>
      </div>
    );
  }
});