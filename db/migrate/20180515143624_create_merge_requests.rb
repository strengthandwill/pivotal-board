class CreateMergeRequests < ActiveRecord::Migration
  def change
    create_table :merge_requests do |t|
      t.string :project_name
      t.string :description
      t.string :state
    end
  end
end
