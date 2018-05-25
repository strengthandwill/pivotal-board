class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :person_id
      t.string  :username
      t.string  :name
      t.string  :image_path

      t.timestamps null: false
    end
    add_index :people, :username, unique: true
  end
end
