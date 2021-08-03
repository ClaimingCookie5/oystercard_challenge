CARD_LIMIT = 90
MINIMUM_FARE = 1

class Oystercard
  attr_reader :balance, :entry_station
  def initialize
    @balance = 0
    @status = "not travelling"
    @entry_station = nil
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    
    @balance += amount
  end

  def in_journey?
    return false if @status == "not travelling"
    return true if @status == "travelling"
  end

  def touch_in(station)
    raise "Insufficient funds, please top up" if @balance < MINIMUM_FARE

    @entry_station = station
    @status = "travelling"
  end

  def touch_out
    self.deduct
    @status = "not travelling"
  end

  private

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end


end