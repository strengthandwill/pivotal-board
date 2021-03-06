var Board = React.createClass({
  initBoardColors: function() {
    changeBacklogColor($("#unstarted"),  this.props.settings.unstarted_color);
    changeBacklogColor($("#started"),    this.props.settings.started_color);
    changeBacklogColor($("#finished"),   this.props.settings.finished_color);
    changeBacklogColor($("#delivered"),  this.props.settings.delivered_color);
    changeBacklogColor($("#review"),    this.props.settings.review_color);
    changeBacklogColor($("#accepted"),   this.props.settings.accepted_color);
  },
  loadStoriesFromServer: function() {
    $.ajax({
      url: "/board/stories/" + this.props.account.path,
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
      review_stories: [],
      review_story_points: 0,
      accepted_stories: [],
      accepted_story_points: 0,
      merge_request_stories: [],
      merge_request_story_points: 0,
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
  renderMergeRequestsBacklog: function() {
    if (this.props.account.merge_requests==true) {
      return (
        <Backlog name="Merge Requests"  id="review"
          stories={this.state.backlog.merge_request_stories}
          story_points={this.state.backlog.merge_request_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
      )
    } else {
      return false;
    }
  },
  renderImpededBacklog: function() {
    if (this.props.account.merge_requests==false) {
      return (
        <Backlog name="Review"  id="review"
          stories={this.state.backlog.review_stories}
          story_points={this.state.backlog.review_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
      )
    } else {
      return false;
    }
  },
  render: function() {
    return (
      <div className="board">
        <Backlog name="DEV Todo" id="unstarted"
          stories={this.state.backlog.unstarted_stories}
          story_points={this.state.backlog.unstarted_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
        <Backlog name="DEV In Progress"  id="started"
          stories={this.state.backlog.started_stories}
          story_points={this.state.backlog.started_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
        {this.renderMergeRequestsBacklog()}
        <Backlog name="QE Testing" id="finished"
          stories={this.state.backlog.finished_stories}
          story_points={this.state.backlog.finished_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
        <Backlog name="PPO Review" id="delivered"
          stories={this.state.backlog.delivered_stories}
          story_points={this.state.backlog.delivered_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
        {this.renderImpededBacklog()}
        <Backlog name="Done"  id="accepted"
          stories={this.state.backlog.accepted_stories}
          story_points={this.state.backlog.accepted_story_points}
          settings={this.props.settings}
          show_started_time={this.props.show_started_time}
          owner_image={this.props.owner_image} />
      </div>
    );
  }
});