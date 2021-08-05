class JourneyLog
  attr_reader :journeys
  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = @journey_class.new
    @current_journey.entry_station = station
  end

  def finish(station)
    @current_journey.exit_station = station
    log_journey
  end


  def log_journey
    @journeys << @current_journey
  end

  # private

  def current_journey
    @current_journey ||= @journey_class.new
  end
end
