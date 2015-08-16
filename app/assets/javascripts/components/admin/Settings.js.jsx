Settings = React.createClass({
  render: function () {
    console.log(this.props.settings['unstarted_color']);
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Settings</div>
        <div className="panel-body">
          <form url="/admin/update" className="form-horizontal">
            <SettingRow id="interval" type="integer" name="Polling Interval (s)"
                        value={this.props.settings.interval}  />
            <SettingRow id="unstarted_color" type="color" name="DEV Todo"
                        value={this.props.settings.unstarted_color} />
            <SettingRow id="started_color" type="color" name="DEV In Progress"
                        value={this.props.settings.started_color} />
            <SettingRow id="finished_color"  type="color" name="QE Testing"
                        value={this.props.settings.finished_color} />
            <SettingRow id="delivered_color" type="color" name="PPO Acceptance"
                        value={this.props.settings.delivered_color} />
            <SettingRow id="impeded_color" type="color" name="Impeded"
                        value={this.props.settings.impeded_color} />
            <SettingRow id="accepted_color" type="color" name="Done"
                        value={this.props.settings.accepted_color} />
            <hr />     
            <SettingRow id="feature_color" type="color" name="Feature"
                        value={this.props.settings.feature_color} />
            <SettingRow id="chore_color" type="color" name="Chore"
                        value={this.props.settings.chore_color} />
            <SettingRow id="bug_color" type="color" name="Bug"
                        value={this.props.settings.bug_color} />
            <SettingRow id="retro_color" type="color" name="Retro"
                        value={this.props.settings.retro_color} />
          </form>    
        </div>
      </div>
    );
  }
});