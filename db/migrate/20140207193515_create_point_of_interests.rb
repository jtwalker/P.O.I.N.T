class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.float :latitude
      t.float :longitude
      t.text :summary
      t.text :sponsor_info
      t.text :artist_info
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
