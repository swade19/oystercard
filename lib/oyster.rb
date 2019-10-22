class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(topup)
    fail "Maximum limit £#{MAXIMUM_BALANCE} exceeded" if limit(topup)
    @balance = @balance + topup
  end

  def deduct(deduct)
    @balance = @balance - deduct
  end

  def limit(topup)
    @balance + topup > MAXIMUM_BALANCE
  end
end
