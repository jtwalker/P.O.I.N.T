class RenamePictureId < ActiveRecord::Migration
  def change
    rename_column :pictures, :id, :picture_id
  end
end
