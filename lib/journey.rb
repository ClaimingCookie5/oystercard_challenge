PENALTY_FARE = 6
MINIMUM_FARE = 1

class Journey
  attr_accessor :entry_station, :exit_station, :journey_log

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    !entry_station.nil?
  end


end