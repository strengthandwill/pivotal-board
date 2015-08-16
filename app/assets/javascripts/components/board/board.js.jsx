var Board = React.createClass({
  initBoardColors: function() {
    changeBacklogColor($("#unstarted"),  this.props.colors.unstarted);
    changeBacklogColor($("#started"),    this.props.colors.started);
    changeBacklogColor($("#finished"),   this.props.colors.finished);
    changeBacklogColor($("#delivered"),  this.props.colors.delivered);
    changeBacklogColor($("#impeded"),    this.props.colors.impeded);
    changeBacklogColor($("#accepted"),   this.props.colors.accepted);
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
    this.timer = setInterval(this.loadStoriesFromServer, this.props.reload*1000);
  },
  componentWillUnmount: function() {
    clearInterval(this.timer);
  },
  render: function() {
    return (
      <div className="board">
        <Backlog name="DEV Todo" id="unstarted"
          stories={this.state.backlog.unstarted_stories}
          story_points={this.state.backlog.unstarted_story_points}
          colors={this.props.colors} />
        <Backlog name="DEV In Progress"  id="started"
          stories={this.state.backlog.started_stories}
          story_points={this.state.backlog.started_story_points}
          colors={this.props.colors} />
        <Backlog name="QE Testing" id="finished"
          stories={this.state.backlog.finished_stories}
          story_points={this.state.backlog.finished_story_points}
          colors={this.props.colors} />
        <Backlog name="PPO Acceptance" id="delivered"
          stories={this.state.backlog.delivered_stories}
          story_points={this.state.backlog.delivered_story_points}
          colors={this.props.colors} />
        <Backlog name="Impeded"  id="impeded"
          stories={this.state.backlog.impeded_stories}
          story_points={this.state.backlog.impeded_story_points}
          colors={this.props.colors} />
        <Backlog name="Done"  id="accepted"
          stories={this.state.backlog.accepted_stories}
          story_points={this.state.backlog.accepted_story_points}
          colors={this.props.colors} />
      </div>
    );
  }
});