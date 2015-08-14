var Board = React.createClass({
  render: function() {
    return (
      <div className="board">
        <Backlog name="DEV Todo" 
                 stories={this.props.data.unstarted_stories} 
                 story_points={this.props.data.unstarted_story_points} />
        <Backlog name="DEV In Progress" 
                 stories={this.props.data.started_stories}
                 story_points={this.props.data.started_story_points} />
        <Backlog name="QE Testing" 
                 stories={this.props.data.finished_stories}
                 story_points={this.props.data.finished_story_points} />
        <Backlog name="PPO Acceptance" 
                 stories={this.props.data.delievered_stories}
                 story_points={this.props.data.delivered_story_points} />
        <Backlog name="Impeded" 
                 stories={this.props.data.impeded_stories}
                 story_points={this.props.data.impeded_story_points} />
        <Backlog name="Done" 
                 stories={this.props.data.accepted_stories}
                 story_points={this.props.data.accepted_story_points} />
      </div>
    );
  }
});