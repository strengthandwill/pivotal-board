SettingRow = React.createClass({
  componentDidMount: function() {
    if (this.props.type="color") {
      changeElementColor($("#" + this.labelId), this.props.value);
    }
  },
  render: function() {
    this.labelId = this.props.id + "-label";
    return (
      <div className="form-group">
        <label id={this.labelId} for={this.props.id} className="col-sm-offset-3 col-sm-2 control-label">{this.props.name}</label>
        <div className="col-sm-3">
          <input type="text" className="form-control" id={this.props.id} name={this.props.id} value={this.props.value} />
        </div>
        <div className="col-sm-2">
          <button className="btn btn-primary">Update</button>
        </div>
      </div>
    );
  }
});