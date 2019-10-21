class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(topup)
    fail "Maximum limit exceeded" if @balance + topup > 90
    @balance = @balance + topup
  end
end
