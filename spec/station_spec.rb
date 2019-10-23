require "station"
describe Station do
  let(:station) { Station.new("kings_cross", 1) }

  it "is a instance of station" do
    expect(station).to be_a(Station)
  end

  it "has a name" do
    expect(station.name).to eq("kings_cross")
  end

  it " has a zone" do
    expect(station.zone).to eq 1
  end
end
