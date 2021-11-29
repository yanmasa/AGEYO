class RenameProfileImageUrlColumnToContributors < ActiveRecord::Migration[5.2]
  def change
    rename_column :contributors, :profile_image_url, :profile_image_id
  end
end