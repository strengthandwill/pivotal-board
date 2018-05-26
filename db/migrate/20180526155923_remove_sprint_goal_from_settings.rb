class RemoveSprintGoalFromSettings < ActiveRecord::Migration
  def change
    remove_column :settings, :sprint_goal_bahamut, :string
    remove_column :settings, :sprint_goal_omega, :string
    remove_column :settings, :sprint_goal_challenger, :string
    remove_column :settings, :sprint_goal_constellation, :string
  end
end
