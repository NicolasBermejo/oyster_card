require './lib/Station'


describe Station do

  subject {described_class.new(name: 'Tooting', zone: 3)}

  it 'knows its name' do
    expect(subject.name).to eq('Tooting')
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(3)
  end

end
