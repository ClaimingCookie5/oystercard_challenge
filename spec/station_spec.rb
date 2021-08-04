require 'station'

describe Station do

  let (:station) { Station.new("Stockwell", 2)}

  it "is expected to show the station name" do
    expect(station.name).to eq("Stockwell")
  end

  it "is expected to show the station zone" do
    expect(station.zone).to eq(2)
  end

end