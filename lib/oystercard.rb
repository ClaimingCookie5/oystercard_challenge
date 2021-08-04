CARD_LIMIT = 90
MINIMUM_FARE = 1

class Oystercard
  attr_accessor :entry_station, :exit_station
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
    raise 'Insufficient funds, please top up' if @balance < MINIMUM_FARE

    @entry_station = station
    exit_station = nil
  end

  def touch_out(station)
    self.deduct
    @exit_station = station
    @journey.log_journey
    entry_station = nil
  end

  private



end