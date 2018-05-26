class RemoveRorAppianFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :ror, :boolean
    remove_column :accounts, :appian, :boolean
  end
end
