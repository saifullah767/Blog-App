class RenamePhotoInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :photo, :image
  end
end
