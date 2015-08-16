PeopleRow = React.createClass({
  render: function() {
    return (
      <tr key={this.props.key}>
        <td><img src={this.props.person.image_path} alt="No image" /></td>
        <td>{this.props.person.name}</td>
        <td>{this.props.person.username}</td>
        <td>{this.props.person.email}</td>
        <td>{this.props.person.admin? "Yes": "No"}</td>
      </tr>
    );
  }
});