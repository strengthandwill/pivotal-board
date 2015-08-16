class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :unstarted_color
      t.string :started_color
      t.string :finished_color
      t.string :delivered_color
      t.string :impeded_color
      t.string :accepted_color
      t.string :feature_color
      t.string :chore_color
      t.string :bug_color
      t.string :retro_color
      t.integer :interval

      t.timestamps null: false
    end
  end
end
