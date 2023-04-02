class CreateUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :image_url
      t.string :audio_url

      t.timestamps
    end
  end
end
