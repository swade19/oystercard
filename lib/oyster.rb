class Oystercard
  attr_reader :balance, :in_journey
  

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false

  end

  def top_up(amount)
    fail "Maximum limit £#{MAXIMUM_BALANCE} exceeded" if limit(amount)
    @balance += amount
  end


  def limit(topup)
    @balance + topup > MAXIMUM_BALANCE
  end

  def minimum
    @balance < MINIMUM_BALANCE
  end 

  def touch_in 
    fail "Not enough funds." if minimum
    @in_journey = true 
  end 
  
  def touch_out 
    @in_journey = false 
    @balance -= MINIMUM_BALANCE
  end 

  private 

  def deduct(amount)
    @balance -= amount
  end

end
