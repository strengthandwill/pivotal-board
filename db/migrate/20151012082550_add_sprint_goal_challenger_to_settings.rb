class AddSprintGoalChallengerToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :sprint_goal_challenger, :string
  end
end
