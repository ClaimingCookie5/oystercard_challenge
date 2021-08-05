require 'journey'
# require "oystercard"

describe Journey do
  let (:station) { double(Station.new("Stockwell", 2)) }
  let (:station2) { double(Station.new("Clapham North", 3)) }

  it { is_expected.to respond_to(:in_journey?) }

  describe "#in_journey" do
    it "return true or false" do
      expect(subject.in_journey?).to be(true).or be(false)
    end
  end

end

