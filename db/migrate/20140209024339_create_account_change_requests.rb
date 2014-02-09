class CreateAccountChangeRequests < ActiveRecord::Migration
  def change
    create_table :account_change_requests do |t|
      t.references :user_id, index: true
      t.text :reason_message

      t.timestamps
    end
  end
end
