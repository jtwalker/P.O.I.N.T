class RenameUserIdIdToAcrCommentsPoiTables < ActiveRecord::Migration
  def change
  	rename_column :point_of_interests, :user_id, :user_id
  	rename_column :comments, :user_id, :user_id
  	rename_column :account_change_requests, :user_id, :user_id
  end
end
