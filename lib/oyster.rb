class Oystercard
  attr_reader :balance, :entry_station
  

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
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

  def touch_in(station)
    fail "Not enough funds." if minimum
    @entry_station = station
  end 
  
  def touch_out 
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end 

  def on_journey?
    !!@entry_station
  end

  private 

  def deduct(amount)
    @balance -= amount
  end
end
