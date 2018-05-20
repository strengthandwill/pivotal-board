var Backlog = React.createClass({
  render: function() {
    var settings = this.props.settings;
    var show_started_time = this.props.show_started_time;
    var owner_image = this.props.owner_image;
    return (
      <div id={this.props.id} className="backlog panel panel-default col-md-2">
        <div className="panel-heading">
          <span>{this.props.name}</span>
          <span className="pull-right">{this.props.story_points}</span>
        </div>
        <div className="panel-body">
          {this.props.stories != null && this.props.stories.map(function(story, i) {
            return <Story story={story}
              settings={settings}
              key={i}
              show_started_time={show_started_time}
              owner_image={owner_image} />;
          })}
        </div>
      </div>
    );
  }
});