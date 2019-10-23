require 'station'
require 'journey'


class Oystercard
  attr_reader :balance, :journeys, :current_journey 
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  MINIMUM_FARE = 1


  def initialize
    @balance = 0
    @current_journey = nil 
    @journeys = [] 
  end

  def top_up(amount)
    fail "Maximum limit £#{MAXIMUM_BALANCE} exceeded" if limit(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Not enough funds." if minimum 
    unfinished_journey if @current_journey
    start_new_journey
    begin_new_journey(station)
  end 

  
  def touch_out(station)
    @current_journey ? finish_current_journey(station) : penalty_charge(station)


  end 

  def start_new_journey
    @current_journey = Journey.new 
  end 

  def penalty_charge(station)
    start_new_journey
    finish_current_journey(station)
  end 

  def finish_current_journey(station)
    @current_journey.finish(station)
    deduct(@current_journey.fare)
    add_journey
  end 

  def add_journey 
    @journeys << @current_journey
    delete.current_journey
  end 

  def  delete 
    @current_journey = nil 
  end 



  def on_journey?
    !!@entry_station
  end

  private 

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end

  def limit(topup)
    @balance + topup > MAXIMUM_BALANCE
  end

  def minimum
    @balance < Journey::MINIMUM_FARE
  end 

  
end
