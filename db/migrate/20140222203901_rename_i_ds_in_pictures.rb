class RenameIDsInPictures < ActiveRecord::Migration
  def change
  	rename_column :pictures, :user, :user_id
  	rename_column :pictures, :poi, :poi_id
  end
end
