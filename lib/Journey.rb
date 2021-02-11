require './lib/Station.rb'
require './lib/oystercard.rb'

class Journey
attr_accessor :entry_station, :exit_station

  def initialize(stations = {})
    @entry_station = stations[:entry_station]
    @exit_station = stations[:exit_station]
  end

  def complete?
    entry_station && exit_station
  end

  def fare
    return Oystercard::PENALTY_FARE unless complete?
    Oystercard::MINIMUM_FARE
  end
end
