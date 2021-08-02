
CARD_LIMIT = 90
class Oystercard
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT

    @balance += amount
  end


end