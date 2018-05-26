class AddOwnerImageToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner_image, :boolean, default: true
  end
end
