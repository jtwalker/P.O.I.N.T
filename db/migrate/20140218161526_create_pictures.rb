class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user
      t.integer :poi

      t.timestamps
    end
  end
end
