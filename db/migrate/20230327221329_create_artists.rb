class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.integer :category_id
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
