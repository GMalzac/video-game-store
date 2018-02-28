class RenameProfilePicToPhoto < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :profile_pic, :photo
  end
end
