require "oyster"

describe Oystercard do
let(:card) {Oystercard.new}
    let(:entry_station){ double :station}
    let(:exit_station) { double :station }
    let(:journey) { {entry_station: entry_station, exit_station: exit_station}}

  it "creates an instance of oystercard" do
    expect(card).to be_an_instance_of Oystercard
    # it {is_expected.to be_an_instance of Oystercard}
  end
  describe "#initialize" do
    it "initializes an Oystercard with a balance of 0" do
      expect(card.balance).to eq 0
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "increase balance by the amount of top-up" do
      card.top_up(20)
      expect(card.balance).to eq 20
    end

    it "raises error and prevents balance exceeding £90" do
      expect { card.top_up(91) }.to raise_error "Maximum limit £#{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

  describe '#touch_in' do 
    it 'adjusts the value of in_journey to true' do
      card.top_up(90)
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end
    it 'does not let customers touch in if they dont have the min fare' do 
    expect { card.touch_in(entry_station) }.to raise_error "Not enough funds."
    end 
  end

  describe '#touch_out' do
   
    it 'reduced the balance of the oystercard by min charge' do
      card.top_up(1)
      expect{card.touch_out(exit_station)}.to change {card.balance}.by -1
    end
  end

  it 'stores the entry station' do
    card.top_up(20)
    card.touch_in(entry_station)
    expect(card.entry_station).to eq entry_station
  end

  it "Stores the exit station" do 
    card.top_up(40)
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.exit_station).to eq exit_station
  end 

  it "stores the customer journey" do
    card.top_up(40)
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.journeys).not_to be_empty
  end 

end
