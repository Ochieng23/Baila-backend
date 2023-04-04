class Remove < ActiveRecord::Migration[7.0]
  def change
    rename_column :listeners, :password, :password_digest
  end
end
