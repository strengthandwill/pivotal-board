var BoardLite = React.createClass({
  initBoardColors: function() {
    changeBacklogColor($("#unstarted"),  this.props.settings.unstarted_color);
    changeBacklogColor($("#started"),    this.props.settings.started_color);
    changeBacklogColor($("#finished"),   this.props.settings.finished_color);
    changeBacklogColor($("#delivered"),  this.props.settings.delivered_color);
    changeBacklogColor($("#impeded"),    this.props.settings.impeded_color);
    changeBacklogColor($("#accepted"),   this.props.settings.accepted_color);
  },
  loadStoriesFromServer: function() {
    $.ajax({
      url: "/board/stories/" + this.props.team,
      dataType: "json",
      cache: false,
      success: function(data) {
        this.setState({backlog: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("loadStoriesFromServer", status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {backlog: {
      unstarted_stories: [],
      unstarted_story_points: 0,
      started_stories: [],
      started_story_points: 0,
      finished_stories: [],
      finished_story_points: 0,
      delivered_stories: [],
      delivered_story_points: 0,
      impeded_stories: [],
      impeded_story_points: 0,
      accepted_stories: [],
      accepted_story_points: 0
    }};
  },
  componentDidMount: function() {
    this.setState({backlog: this.props.backlog});
    this.initBoardColors();
    this.timer = setInterval(this.loadStoriesFromServer, this.props.settings.interval*1000);
  },
  componentWillUnmount: function() {
    clearInterval(this.timer);
  },
  render: function() {
    return (
      <div className="board">
        <BacklogLite name="DEV Todo" id="unstarted"
          stories={this.state.backlog.unstarted_stories}
          story_points={this.state.backlog.unstarted_story_points}
          settings={this.props.settings} />
        <BacklogLite name="DEV In Progress"  id="started"
          stories={this.state.backlog.started_stories}
          story_points={this.state.backlog.started_story_points}
          settings={this.props.settings} />
        <BacklogLite name="QE Testing" id="finished"
          stories={this.state.backlog.finished_stories}
          story_points={this.state.backlog.finished_story_points}
          settings={this.props.settings} />
      </div>
    );
  }
});