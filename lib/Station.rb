require './lib/oystercard.rb'
require './lib/Journey.rb'

class Station
attr_reader :name, :zone

def initialize(name:, zone:)
  @name = name
  @zone = zone
end

end
