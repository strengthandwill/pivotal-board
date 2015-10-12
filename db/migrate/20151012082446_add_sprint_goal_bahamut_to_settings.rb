class AddSprintGoalBahamutToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :sprint_goal_bahamut, :string
  end
end
