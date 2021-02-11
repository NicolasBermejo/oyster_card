require './lib/Journey.rb'
require './lib/Station.rb'


class Oystercard

	LIMIT = 90
	MINIMUM_FARE = 1
	PENALTY_FARE = 6
	attr_reader :balance, :journeys, :current_journey

	def initialize
		@balance = 0
    @journeys = []
		@current_journey = nil
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def touch_in(station)
		fail "You need at least £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
		pay(PENALTY_FARE) if in_journey?
		self.current_journey = Journey.new(entry_station: station)
	end

	def touch_out(station)
		no_touch_in(station)
		journeys << current_journey
		pay(journeys.last.fare)
		self.current_journey = nil
	end

	def in_journey?
		!!current_journey
	end

private

	attr_writer :current_journey

	def pay(amount)
		@balance -= amount
	end

	def no_touch_in(station)
		if in_journey?
			current_journey.exit_station = station
		else
			self.current_journey = Journey.new(exit_station: station)
		end
	end
end
