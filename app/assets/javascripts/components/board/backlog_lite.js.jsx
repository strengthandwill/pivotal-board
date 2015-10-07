var BacklogLite = React.createClass({
  render: function() {
    var settings = this.props.settings;
    return (
      <div id={this.props.id} className="backlog panel panel-default col-md-4">
        <div className="panel-heading">
          <span>{this.props.name}</span>
          <span className="pull-right">{this.props.story_points}</span>
        </div>
        <div className="panel-body">
          {this.props.stories != null && this.props.stories.map(function(story, i) {
            return <Story story={story} settings={settings} key={i} />;
          })}
        </div>
      </div>
    );
  }
});