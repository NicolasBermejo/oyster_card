require './lib/Journey.rb'
require './lib/Station.rb'


class Oystercard

	LIMIT = 90
	MINIMUM_FARE = 1
	PENALTY_FARE = 6
	attr_reader :balance, :entry_station, :exit_station, :journeys

	def initialize
		@balance = 0
		@entry_station = nil
    @exit_station = nil
    @journeys = {:entry => [], :exit => []}
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def touch_in(station)
		fail "You need at least £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
		@entry_station = station
    @journeys[:entry] << @entry_station
		@journey = Journey.new(station)
	end

	def touch_out(station)
    pay(MINIMUM_FARE)
		@entry_station = nil
    @exit_station = station
    @journeys[:exit] << @exit_station
		@journey.exit(station)
	end

	def in_journey?
		!!entry_station
	end

private

	def pay(amount)
		@balance -= amount
	end

end
