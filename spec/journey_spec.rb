require "journey"

describe Journey do
  let(:journey) { Journey.new }
  it "has an  entry method" do
    expect(journey).to respond_to(:start)
  end

  it "has an  exit method" do
    expect(journey).to respond_to(:finish)
  end
end
