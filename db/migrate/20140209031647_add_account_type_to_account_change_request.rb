class AddAccountTypeToAccountChangeRequest < ActiveRecord::Migration
  def change
    add_column :account_change_requests, :account_type, :string
  end
end
