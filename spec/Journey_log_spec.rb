require './lib/Journey_log.rb'
require './lib/oystercard.rb'
require './lib/Journey.rb'
require './lib/Station.rb'

describe Journey_log do
  # let(:journey_class){double}
  # let(:subject){Journey_log.new(journey_class)}
  let(:station){double(:station)}

  it { is_expected.to respond_to(:start).with(1).argument }
  it { is_expected.to respond_to(:finish).with(1).argument }
  it { is_expected.to respond_to(:current_journey).with(1).argument }
  it { is_expected.to respond_to(:journeys) }

  describe '#journeys' do

    it 'should return a list of journeys' do
      5.times{subject.start(station)}
      expect(subject.journeys.last).to be_a(Journey)
    end
  end

  describe '#start' do

    it 'should create a journey' do
       subject.start(station)
       expect(subject.current_journey).to be_a(Journey)
    end

    it 'should save the entry station' do
      subject.start(station)
      expect(subject.current_journey.entry_station).to be(station)
    end
   end

  describe '#finish' do

     it 'should save the exit station' do
        subject.start(station)
        subject.finish(station)
        expect(subject.current_journey.exit_station).to be(station)
      end
  end

end
