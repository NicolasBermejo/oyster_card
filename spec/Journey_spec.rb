require './lib/oystercard'
require './lib/station'
require './lib/Journey'

describe Journey do
let(:entry_station) {double(:station)}
let(:exit_station) {double(:station)}
subject{described_class.new("Acton", "Ealing" )}

  it 'should be completed' do
    expect(subject).to be_complete
  end

  context 'only one station' do
    subject{described_class.new(nil, "Ealing" )}
    it 'should not be compolete' do
      expect(subject).to_not be_complete
    end

    it 'should return a penlaty fare' do
      expect(subject.fare).to eq(Oystercard::PENALTY_FARE)
    end

  end

  it 'should return a fare for the journey' do
    expect(subject.fare).to eq(Oystercard::MINIMUM_FARE)
  end

end
