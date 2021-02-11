require './lib/Station.rb'
require './lib/oystercard.rb'

class Journey
attr_reader :entry, :exit

  def initialize(entry:, exit:)
    @entry = entry
    @exit = exit
  end

end
