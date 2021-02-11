require './lib/Station.rb'
require './lib/oystercard.rb'

class Journey
attr_reader :entry_station, :exit_station

  def initialize(entry=nil)
    @entry_station = entry
  end

  def exit(exit=nil)
    @exit_station = exit
  end

  def complete?
    entry_station && exit_station
  end

  def fare
    return Oystercard::PENALTY_FARE unless complete?
    Oystercard::MINIMUM_FARE
  end
end
