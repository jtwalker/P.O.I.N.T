class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :external_user_id
      t.string :provider
      t.string :account_type

      t.timestamps
    end
  end
end
