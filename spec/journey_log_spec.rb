require 'journey_log'

describe JourneyLog do

  describe '#end' do

    it "expect #end_journey to update @exit_station" do
      subject.end(station)
      expect(subject.exit_station).to eq(station) 
    end

  end
end