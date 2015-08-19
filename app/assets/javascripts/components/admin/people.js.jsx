People = React.createClass({
  handleOnClickReloadPeople: function(event) {
    $.ajax({
      url: "/admin/reload",
      dataType: "json",
      cache: false,
      success: function(data) {
        this.setState({people: data});
        alert("Reload " + data.length + " people complete!");
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("handleReloadPeople", status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {people: []}
  },
  componentDidMount: function() {
    this.setState({people: this.props.people});
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">People</div>
        <div className="panel-body">
          <p><button className="btn btn-primary" onClick={this.handleOnClickReloadPeople}>Reload People</button></p>
    <p>
      <table className="table table-hover">
        <thead>
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Admin</th>
          </tr>
        </thead>
        <tbody>
          {this.state.people.map(function(person, key) {
              return <PeopleRow person={person} key={key} />
          })}
        </tbody>
      </table>
    </p>
  </div>
</div>
    );
  }
});