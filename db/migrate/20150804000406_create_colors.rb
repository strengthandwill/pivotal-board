class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :unstarted
      t.string :started
      t.string :finished
      t.string :delivered
      t.string :impeded
      t.string :accepted
      t.string :feature
      t.string :chore
      t.string :bug
      t.string :retro
      t.string :rejected

      t.timestamps null: false
    end
  end
end
