SettingsRow = React.createClass({
  updateElementColor: function() {
    if (this.props.id.indexOf("color")!=-1) {
      changeElementColor($("#" + this.labelId), this.state.value);
    }
  },
  handleOnSubmit: function(e) {
    e.preventDefault();
    var value = React.findDOMNode(this.refs[this.props.id]).value.trim();
    var setting = {};
    setting[this.props.id] = value;
    $.ajax({
      url: "/admin/update",
      type: "PATCH",
      dataType: "json",
      cache: false,
      data: {setting: setting},
      success: function(data) {
        this.setState({value: value});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("handleOnSubmit", status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {value: this.props.settings[this.props.id]}
  },
  componentWillMount: function() {
    this.labelId = this.props.id + "-label";
  },
  componentDidMount: function() {
    this.updateElementColor();
  },
  render: function() {
    this.updateElementColor();
    return (
      <form className="form-inline" onSubmit={this.handleOnSubmit}>
        <div className="form-group">
          <label id={this.labelId} for={this.props.id} 
                 className="col-sm-offset-3 col-sm-2 control-label">{this.props.name}</label>
          <div className="col-sm-3">
            <input type="text" className="form-control" ref={this.props.id}
                   defaultValue={this.state.value} />
          </div>
          <div className="col-sm-2">
            <button type="submit" className="btn btn-primary">Update</button>
          </div>
        </div>
      </form>
    );
  }
});