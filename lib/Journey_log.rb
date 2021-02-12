require './lib/oystercard.rb'
require './lib/Journey.rb'
require './lib/Station.rb'


class Journey_log
attr_reader :journeys_history, :current_journey, :journey_class

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys_history = []
    @incomplete_journey = nil
  end

  def start(station)
    if @incomplete_journey != nil
      @incomplete_journey = journey_class.new(entry_station: station)
    else

  end

  def finish(station)
    current_journey.exit_station(station)
    @incomplete_journey = nil
  end

  def current_journey
    #journey_class.new(entry_station: station) unless @incomplete_journey
    @current_journey ||= journey_class.new
  end

  def journeys
    @journeys_history
  end

end
