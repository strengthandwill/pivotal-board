var Board = React.createClass({
  render: function() {
    return (
      <div className="board">
        <Backlog name="DEV Todo" stories={this.props.data.unstarted_stories} />
        <Backlog name="DEV In Progress" stories={this.props.data.started_stories} />
        <Backlog name="QE Testing" stories={this.props.data.finished_stories} />
        <Backlog name="PPO Acceptance" stories={this.props.data.delievered_stories} />
        <Backlog name="Impeded" stories={this.props.data.impeded_stories} />
        <Backlog name="Done" stories={this.props.data.accepted_stories}/>
      </div>
    );
  }
});