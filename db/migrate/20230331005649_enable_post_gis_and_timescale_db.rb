class EnablePostGisAndTimescaleDb < ActiveRecord::Migration[7.0]
  def up
    enable_extension "postgis"
    enable_extension "timescaledb"
  end

  def down
    disable_extension "postgis"
    disable_extension "timescaledb"
  end
end
