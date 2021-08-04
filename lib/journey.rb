PENALTY_FARE = 6

class Journey

  def initialize
    @journey_log = []
  end

  def in_journey?
    !entry_station.nil?
  end

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end

  def log_journey
    if !entry_station.nil? && !exit_station.nil?
      @journey_log << { entry_station: entry_station, exit_station: exit_station }
    end
  end

  def start_journey(station)
    deduct if !@entry_station.nil?

    @entry_station = station
    exit_station = nil
  end

end