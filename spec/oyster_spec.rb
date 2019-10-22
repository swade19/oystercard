require "oyster"

describe Oystercard do
  it "creates an instance of oystercard" do
    expect(subject).to be_an_instance_of Oystercard
    # it {is_expected.to be_an_instance of Oystercard}
  end
  describe "#initialize" do
    it "initializes an Oystercard with a balance of 0" do
      expect(subject.balance).to eq 0
      expect(subject.in_journey).to eq false
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "increase balance by the amount of top-up" do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end

    it "raises error and prevents balance exceeding £90" do
      expect { subject.top_up(91) }.to raise_error "Maximum limit £#{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

  describe '#deduct' do
    it 'reduced the balance of the oystercard' do
      oystercard = Oystercard.new(100)
      oystercard.deduct(20)
      expect(oystercard.balance).to eq 80
    end
  end

  describe '#touch_in' do 
    it 'adjusts the value of in_journey to true' do
      subject.top_up(90)
      subject.touch_in
      expect(subject.in_journey).to eq true
    end
    it 'does not let customers touch in if they dont have the min fare' do 
    expect { subject.touch_in }.to raise_error "Not enough funds."
    end 
  end

  describe '#touch_out' do
    it 'adjust the value of in_journey to false' do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end
end