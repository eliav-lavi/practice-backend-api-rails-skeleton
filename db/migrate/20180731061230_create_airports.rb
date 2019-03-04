class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.float :latitude
      t.float :longitude
      t.integer :elevation_in_feet
      t.float :gmt
      t.string :timezone

      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }
    end

    add_index :airports, :iata
    add_index :airports, :icao
  end
end
