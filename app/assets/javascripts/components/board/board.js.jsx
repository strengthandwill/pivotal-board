var Board = React.createClass({
  initBoardColors: function() {
    changeBacklogColor($("#unstarted"),  this.props.colors.unstarted);
    changeBacklogColor($("#started"),    this.props.colors.started);
    changeBacklogColor($("#finished"),   this.props.colors.finished);
    changeBacklogColor($("#delivered"),  this.props.colors.delivered);
    changeBacklogColor($("#impeded"),    this.props.colors.impeded);
    changeBacklogColor($("#accepted"),   this.props.colors.accepted);
    changeStoryColor($(".feature"),      this.props.colors.feature);
    changeStoryColor($(".chore"),        this.props.colors.chore);
    changeStoryColor($(".bug"),          this.props.colors.bug);
    changeStoryColor($(".retro"),        this.props.colors.retro);
  },
  componentDidMount: function() {
    this.initBoardColors();
  },
  render: function() {
    return (
      <div className="board">
        <Backlog name="DEV Todo" id="unstarted"
                 stories={this.props.backlog.unstarted_stories} 
                 story_points={this.props.backlog.unstarted_story_points} />
        <Backlog name="DEV In Progress"  id="started"
                 stories={this.props.backlog.started_stories}
                 story_points={this.props.backlog.started_story_points} />
        <Backlog name="QE Testing" id="finished"
                 stories={this.props.backlog.finished_stories}
                 story_points={this.props.backlog.finished_story_points} />
        <Backlog name="PPO Acceptance" id="delivered"
                 stories={this.props.backlog.delievered_stories}
                 story_points={this.props.backlog.delivered_story_points} />
        <Backlog name="Impeded"  id="impeded"
                 stories={this.props.backlog.impeded_stories}
                 story_points={this.props.backlog.impeded_story_points} />
        <Backlog name="Done"  id="accepted"
                 stories={this.props.backlog.accepted_stories}
                 story_points={this.props.backlog.accepted_story_points} />
      </div>
    );
  }
});