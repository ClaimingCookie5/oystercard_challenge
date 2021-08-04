require 'journey'
# require "oystercard"

describe Journey do

  it { is_expected.to respond_to(:in_journey?) }

  describe "#in_journey" do

    it "return true or false" do
      expect(subject.in_journey?).to be(true).or be(false)
    end
  end

  describe "#start_journey" do
  
    it "expect #start_journey to update #in_journey" do
      subject.start_journey(station, balance)
      expect(subject.in_journey).to eq(true) 
      
    it "does not allow start journey when balance is below minimum fare" do
        expect { subject.start_journey(station, 0) }.to raise_error "Insufficient funds, please top up"
    end
end
