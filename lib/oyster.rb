class Oystercard
  attr_reader :balance, :in_journey
  

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum limit £#{MAXIMUM_BALANCE} exceeded" if limit(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def limit(topup)
    @balance + topup > MAXIMUM_BALANCE
  end

  def touch_in 
    @in_journey = true 
  end 
  
  def touch_out 
    @in_journey = false 
  end 
  
end
