class CreatePendingPictureUploads < ActiveRecord::Migration
  def change
    create_table :pending_picture_uploads do |t|
      t.references :user, index: true
      t.references :picture, index: true

      t.timestamps
    end
  end
end
