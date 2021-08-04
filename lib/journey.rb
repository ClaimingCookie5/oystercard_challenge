PENALTY_FARE = 6
MINIMUM_FARE = 1

class Journey
  attr_accessor :entry_station

  def initialize
    @entry_station = nil
    @exit_station = nil
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

  def start_journey(station, balance)
    deduct(PENALTY_FARE) if !@entry_station.nil?
    raise 'Insufficient funds, please top up' if balance < MINIMUM_FARE

    @entry_station = station
    @exit_station = nil
  end

  def end_journey(station)
    deduct(PENALTY_FARE) if !@exit_station.nil?
    @exit_station = station
  end

end