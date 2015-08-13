var Backlog = React.createClass({
  render: function() {
    return (
      <div className="backlog panel panel-default col-md-2">
        <div className="panel-heading">{this.props.name}</div>
        <div className="panel-content">
          {this.props.stories != null && this.props.stories.map(function(story) {
            return <Story story={story} />;
          })}
        </div>
      </div>
    );
  }
});