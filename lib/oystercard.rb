class Oystercard
	LIMIT = 90
	MINIMUM_FARE = 1
	attr_reader :balance, :entry_station#, in_journey

	def initialize
		@balance = 0

		@entry_station = nil
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def touch_in(station)
		fail "You need at least £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
		@entry_station = station
	end

	def touch_out
		pay(MINIMUM_FARE)
		@entry_station = nil
	end

	def in_journey?
		!!entry_station
	end

private

	def pay(amount)
		@balance -= amount
	end

end
