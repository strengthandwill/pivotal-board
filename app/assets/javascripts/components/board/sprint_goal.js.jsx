var SprintGoal = React.createClass({
  getSprintGoal: function() {
    if (this.props.team == "bahamut") {
      return this.props.settings.sprint_goal_bahamut
    } else if (this.props.team == "omega") {
      return this.props.settings.sprint_goal_omega
    } if (this.props.team == "challenger") {
      return this.props.settings.sprint_goal_challenger
    }
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading text-center">Sprint Goal: <b>{this.getSprintGoal()}</b></div>
      </div>
    )  
  }
});