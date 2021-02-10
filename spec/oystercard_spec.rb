require 'oystercard'

describe Oystercard do
let(:station){double :station}
let(:entry_station){double :station}
let(:exit_station){double :station}

min = Oystercard::MINIMUM_FARE
max = Oystercard::LIMIT
it { is_expected.to respond_to(:top_up).with(1).argument }
it { is_expected.to respond_to(:touch_in).with(1).argument }
it { is_expected.to respond_to(:touch_out) }
it { is_expected.to respond_to(:in_journey?) }

	describe '#initialize' do
		it 'should have a default balance of zero' do
			expect(subject.balance).to eq(0)
		end
	end

	describe '#top_up' do
		it "raises an error when limit is exceeded" do
			subject.top_up(max)
			expect{ subject.top_up 1 }.to raise_error "You cannot top up more than £#{max}"
		end
	end

	describe '#touch_in' do
		it 'should update the status of the card to "in journey"' do
      subject.top_up(min)
			subject.touch_in(station)
			expect( subject.in_journey? ).to be true
		end

    it 'should not let us touch in without at least £1 on the card' do
			expect { subject.touch_in(station) }.to raise_error "You need at least £#{min}"
    end

    it 'should save which station you touched in' do
			subject.top_up(min)
			subject.touch_in(station)
			expect(subject.entry_station).to eq(station)
		end

	end

	describe '#touch_out' do
		it 'should update the status of the card to "not in journey"' do
      subject.top_up(1)
			subject.touch_in(station)
			subject.touch_out
			expect(subject.in_journey?).to be false
		end

		it 'should update the balance after a trip' do
			subject.top_up(min)
			subject.touch_in(station)
			expect {subject.touch_out}.to change {subject.balance}.by (-min)
		end
	end

	describe '#in_journey' do
		it 'should not be in a journey by default' do
			expect(subject.in_journey?).to be false
		end
	end
end
