class AddMainImageToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :main_image, :boolean
  end
end
