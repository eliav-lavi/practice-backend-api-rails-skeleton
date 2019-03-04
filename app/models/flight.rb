class Flight < ApplicationRecord
  MINIMAL_LAYOVER_TIME = 1.hour * 0.75
  MAXIMAL_LAYOVER_TIME = 1.hour * 12

  def possible_connections_to(*iata)
    self.class.where(origin: destination, destination: iata, departure_datetime: connection_departure_range)
  end

  def as_json(options = nil)
    super.except('created_at', 'updated_at')
  end

  private

  def connection_departure_range
    (arrival_datetime + MINIMAL_LAYOVER_TIME)..(arrival_datetime + MAXIMAL_LAYOVER_TIME)
  end
end
