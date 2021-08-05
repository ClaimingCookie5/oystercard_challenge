CARD_LIMIT = 90

class Oystercard
  attr_reader :balance, :journey_log, :journey

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(journey_class: Journey)
    # @journey = Journey.new
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    
    @balance += amount
  end


  def touch_in(station)
    touch_in_checks
    @journey_log.start(station)
  end

  def touch_out(station)
    touch_out_checks
    deduct
    log_proccess(station)
  end

  private

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end

  def touch_in_checks
    deduct(PENALTY_FARE) if !@journey_log.current_journey.entry_station.nil?
    raise 'Insufficient funds, please top up' if balance < MINIMUM_FARE
  end

  def touch_out_checks
    deduct(PENALTY_FARE) if !@journey_log.current_journey.exit_station.nil?
  end

  def log_proccess(station)
    # @journey.end_journey(station)
    # @journey.log_journey
    @journey_log.finish(station)
    @journey_log.current_journey.entry_station = nil
  end
  
end