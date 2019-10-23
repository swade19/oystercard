class Journey
  attr_reader :entry_station, :exit_station
  #-fare
  #-complete
  #-instances of journey should inited with optional entry station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete_journey
    @entry_station && @exit_station
  end
end
