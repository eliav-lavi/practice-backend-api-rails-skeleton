CLI::UI::StdoutRouter.enable
CLI::UI::Frame.open('{{*}} Batch Import Records {{*}}') do
  spin_group1 = CLI::UI::SpinGroup.new
  spin_group1.add('Import Airports') do
    airports_sql = <<-SQL.squish
        COPY airports (name,city,country,iata,icao,latitude,longitude,elevation_in_feet,gmt,timezone)
        FROM '#{Rails.root}/db/datasets/airports_final.csv'
        CSV HEADER
    SQL

    Airport.connection.execute(airports_sql)
  end
  spin_group1.wait

  spin_group2 = CLI::UI::SpinGroup.new
  spin_group2.add('Import Airlines') do
    airlines_sql = <<-SQL.squish
        COPY airlines (code,name,logo_url)
        FROM '#{Rails.root}/db/datasets/airlines_final.csv'
        CSV HEADER
    SQL

    Airline.connection.execute(airlines_sql)
  end
  spin_group2.wait

  spin_group3 = CLI::UI::SpinGroup.new
  spin_group3.add('Import Flights') do
    flights_sql = <<-SQL.squish
        COPY flights (flight_num,origin,destination,departure_datetime,arrival_datetime,origin_tz,destination_tz,distance,unique_carrier,price)
        FROM '#{Rails.root}/db/datasets/flights_final.csv'
        CSV HEADER
    SQL

    Flight.connection.execute(flights_sql)
  end
  spin_group3.wait
end

puts CLI::UI.fmt '{{v}} Successfully seeded database with data! {{v}}'
