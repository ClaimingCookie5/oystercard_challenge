CARD_LIMIT = 90

class Oystercard
  attr_reader :balance, :journey_log

  def initialize
    @balance = 0
    @journey_log = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    
    @balance += amount
  end


  def touch_in(station)
    deduct(PENALTY_FARE) if !@journey.entry_station.nil?
    raise 'Insufficient funds, please top up' if balance < MINIMUM_FARE

    @journey.start_journey(station)
  end

  def touch_out(station, balance = @balance)
    deduct(PENALTY_FARE) if !@journey.exit_station.nil?
    deduct
    @journey.end_journey(station)
    @journey.log_journey
    @journey.entry_station = nil
  end

  private

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end
end