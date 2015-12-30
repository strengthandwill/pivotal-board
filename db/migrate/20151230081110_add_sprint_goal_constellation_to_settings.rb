class AddSprintGoalConstellationToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :sprint_goal_constellation, :string
  end
end
