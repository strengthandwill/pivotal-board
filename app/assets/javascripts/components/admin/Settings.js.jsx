Settings = React.createClass({
  render: function () {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Settings</div>
        <div className="panel-body">
          <SettingsRow id="sprint_goal_bahamut" type="string" name="Bahamut Sprint Goal"
            settings={this.props.settings}  />
          <SettingsRow id="sprint_goal_omega" type="string" name="Omega Sprint Goal"
            settings={this.props.settings}  />
          <SettingsRow id="sprint_goal_challenger" type="string" name=" Challenger Sprint Goal"
            settings={this.props.settings}  />
          <hr />
          <SettingsRow id="interval" type="integer" name="Polling Interval (s)"
                      settings={this.props.settings}  />
          <hr />
          <SettingsRow id="unstarted_color" type="color" name="DEV Todo"
                      settings={this.props.settings} />
          <SettingsRow id="started_color" type="color" name="DEV In Progress"
                      settings={this.props.settings} />
          <SettingsRow id="finished_color"  type="color" name="QE Testing"
                      settings={this.props.settings} />
          <SettingsRow id="delivered_color" type="color" name="PPO Acceptance"
                      settings={this.props.settings} />
          <SettingsRow id="impeded_color" type="color" name="Impeded"
                      settings={this.props.settings} />
          <SettingsRow id="accepted_color" type="color" name="Done"
                      settings={this.props.settings} />
          <hr />     
          <SettingsRow id="feature_color" type="color" name="Feature"
                      settings={this.props.settings} />
          <SettingsRow id="chore_color" type="color" name="Chore"
                      settings={this.props.settings} />
          <SettingsRow id="bug_color" type="color" name="Bug"
                      settings={this.props.settings} />
          <SettingsRow id="retro_color" type="color" name="Retro"
                      settings={this.props.settings} />
        </div>
      </div>
    );
  }
});