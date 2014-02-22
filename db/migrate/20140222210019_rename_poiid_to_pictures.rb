class RenamePoiidToPictures < ActiveRecord::Migration
  def change
  	rename_column :pictures, :poi_id, :point_of_interest_id
  end
end
