var KanbanBoard = React.createClass({
  initBoardColors: function() {
    //changeBacklogColor($("#unstarted"),  this.props.settings.unstarted_color);
    //changeBacklogColor($("#started"),    this.props.settings.started_color);
    //changeBacklogColor($("#finished"),   this.props.settings.finished_color);
    //changeBacklogColor($("#delivered"),  this.props.settings.delivered_color);
    //changeBacklogColor($("#impeded"),    this.props.settings.impeded_color);
    //changeBacklogColor($("#accepted"),   this.props.settings.accepted_color);
  },
  loadStoriesFromServer: function() {
    $.ajax({
      url: "/kanban/stories/" + this.props.team,
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
      started_ror_stories: [],
      started_appian_stories: [],
      finished_stories: [],
      delivered_stories: [],
      impeded_stories: [],
      accepted_undeployed_stories: [],
      accepted_deployed_stories: []
    }};
  },
  componentDidMount: function() {
    this.setState({backlog: this.props.backlog});
    this.initBoardColors();
    //this.timer = setInterval(this.loadStoriesFromServer, this.props.settings.interval*1000);
    this.timer = setInterval(this.loadStoriesFromServer, 3000);
  },
  componentWillUnmount: function() {
    clearInterval(this.timer);
  },
  render: function() {
    return (
      <div className="board">
        <KanbanBacklog name="Backlog" id="unstarted"
          stories={this.state.backlog.unstarted_stories}
          story_points={this.state.backlog.unstarted_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="RoR"  id="started"
          stories={this.state.backlog.started_ror_stories}
          story_points={this.state.backlog.started_ror_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Appian"  id="started"
          stories={this.state.backlog.started_appian_stories}
          story_points={this.state.backlog.started_appian_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Testing" id="finished"
          stories={this.state.backlog.finished_stories}
          story_points={this.state.backlog.finished_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Acceptance" id="delivered"
          stories={this.state.backlog.delivered_stories}
          story_points={this.state.backlog.delivered_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Deployment" id="deployment"
          stories={this.state.backlog.accepted_undeployed_stories}
          story_points={this.state.backlog.accepted_undeployed_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Done"  id="accepted"
          stories={this.state.backlog.accepted_deployed_stories}
          story_points={this.state.backlog.accepted_deployed_stories.length}
          settings={this.props.settings} />
        <KanbanBacklog name="Impeded"  id="impeded"
          stories={this.state.backlog.impeded_stories}
          story_points={this.state.backlog.impeded_stories.length}
          settings={this.props.settings} />
      </div>
    );
  }
});