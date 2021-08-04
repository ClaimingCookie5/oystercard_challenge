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


  def touch_in(station, balance = @balance)
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    @journey.log_journey
    @journey.entry_station = nil
  end
end