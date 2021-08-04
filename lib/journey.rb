PENALTY_FARE = 6
MINIMUM_FARE = 1

class Journey
  attr_accessor :entry_station, :exit_station, :journey_log

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_log = []
  end

  def in_journey?
    !entry_station.nil?
  end



  def log_journey
    if !entry_station.nil? && !exit_station.nil?
      @journey_log << { entry_station: entry_station, exit_station: exit_station }
    end
  end

  def start_journey(station)
    @entry_station = station
    @exit_station = nil
  end

  def end_journey(station)
    @exit_station = station
  end

end