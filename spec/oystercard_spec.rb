require 'oystercard'

describe Oystercard do
  let (:station) { double(Station.new("Stockwell", 2)) }
  let (:station2) { double(Station.new("Clapham North", 3)) }

  before do
    @card1 = Oystercard.new
  end


  it 'checks that a card has an initial balance of 0' do
    expect(@card1.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up) }
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:touch_out) }

  describe "#top_up" do

    it "adds the top up amount to the balance" do
      @card1.top_up(10)
      expect(@card1.balance).to eq(10)
    end

    it "adds the top up amount on top of the existing balance" do
      @card1.top_up(10)
      @card1.top_up(20)
      expect(@card1.balance).to eq(30)
    end

    it "does not allow you to #top_up beyond #{CARD_LIMIT}" do
      @card1.top_up(50)
      expect { @card1.top_up(60) }.to raise_error "Unable to top up 60, balance would exceed card limit of #{CARD_LIMIT}"
    end
  end


  
  describe "#touch_in" do
    it "should deduct penalty fare if there wasn't touch out" do
      @card1.top_up(10)
      @card1.touch_in(station)
      expect { @card1.touch_in(station) }.to change { @card1.balance }.by(-PENALTY_FARE)
    end

    it "does not allow touch in when balance is below minimum fare" do
      expect { @card1.touch_in(station) }.to raise_error "Insufficient funds, please top up"
    end

    it "starts a journey" do
      @card1.top_up(10)
      @card1.touch_in(station)
      expect(@card1.journey.entry_station).to eq(station)
    end
  end

  describe "#touch_out" do

    it "should deduct penalty fare if there wasn't touch in" do
      @card1.touch_out(station)
      expect { @card1.touch_out(station) }.to change { @card1.balance }.by(-PENALTY_FARE-MINIMUM_FARE)
    end

    it "is expected to deduct funds from balance when touch_out is called" do
      expect { @card1.touch_out(station) }.to change { @card1.balance }.by(-MINIMUM_FARE)
    end

    it "entry_station returns nil on touch_out" do
      @card1.touch_out(station2)
      expect(@card1.journey.entry_station).to eq(nil)
    end

    it "records the exit station of the journey" do
      @card1.top_up(10)
      @card1.touch_in(station)
      @card1.touch_out(station2)
      expect(@card1.journey.exit_station).to eq(station2)
    end

  end

  describe '#journey_log' do
    it "is expected to containe an empty list of journeys" do
      expect(@card1.journey_log).to be_empty
    end

    it "is expected to return a list of the entry and exit stations of the Oyster card" do
      @card1.top_up(10)
      @card1.touch_in(station)
      @card1.touch_out(station2)
      expect(@card1.journey.journey_log).to contain_exactly({ entry_station: station, exit_station: station2 })
    end
  end

end
