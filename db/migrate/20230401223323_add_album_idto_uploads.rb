class AddAlbumIdtoUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :album_id, :integer
  end
end
