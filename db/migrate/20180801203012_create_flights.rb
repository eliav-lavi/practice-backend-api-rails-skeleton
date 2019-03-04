class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :flight_num
      t.string :origin
      t.string :destination
      t.timestamp :departure_datetime
      t.timestamp :arrival_datetime
      t.string :origin_tz
      t.string :destination_tz
      t.integer :distance
      t.string :unique_carrier
      t.integer :price

      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }
    end

    add_index :flights, :origin
    add_index :flights, :destination
    add_index :flights, :departure_datetime
    add_index :flights, :arrival_datetime
  end
end
