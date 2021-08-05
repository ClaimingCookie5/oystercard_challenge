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

  # describe "#start_journey" do
  
  #   it "expect #start_journey to update #in_journey" do
  #     subject.start_journey(station)
  #     expect(subject.in_journey?).to eq(true) 
  #   end

  #   it "records the entry station of the journey" do
  #     subject.start_journey(station)
  #     expect(subject.entry_station).to eq(station)
  #   end
    
  # end
end

