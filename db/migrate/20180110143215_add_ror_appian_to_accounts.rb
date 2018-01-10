class AddRorAppianToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :ror, :boolean, default: true
    add_column :accounts, :appian, :boolean, default: true
  end
end
