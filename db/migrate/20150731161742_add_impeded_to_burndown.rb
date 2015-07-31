class AddImpededToBurndown < ActiveRecord::Migration
  def change
    add_column :burndowns, :impeded, :integer
  end
end
