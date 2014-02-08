class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user_id, index: true
      t.references :point_of_interest, index: true
      t.text :body

      t.timestamps
    end
  end
end
