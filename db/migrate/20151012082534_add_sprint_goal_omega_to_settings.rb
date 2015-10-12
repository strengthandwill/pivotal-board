class AddSprintGoalOmegaToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :sprint_goal_omega, :string
  end
end
