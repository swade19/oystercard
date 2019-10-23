class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  MINIMUM_CHARGE = 5


  def initialize
    @balance = 0
    @journeys = [] 
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
  
  def touch_out(station)
    @exit_station = station 
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
    deduct(MINIMUM_BALANCE)

  end 

  def on_journey?
    !!@entry_station
  end

  private 

  def deduct(amount = MINIMUM_CHARGE)
    @balance -= amount
  end

  
end
