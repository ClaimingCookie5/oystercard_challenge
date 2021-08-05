class JourneyLog

  def initialize(journey_class:)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @current_journey.exit_station(station)
  end


  def log_journey
    if !@journey_class.entry_station.nil? && !@journ.exit_station.nil?
      @journeys << [ @current_journey ]
    end
  end

  private

  def current_journey
    @current_journey ||= @journey_class.new
  end

end
