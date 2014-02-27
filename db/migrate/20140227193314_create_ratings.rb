class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true
      t.references :point_of_interest, index: true
      t.integer :rating

      t.timestamps
    end
  end
end
