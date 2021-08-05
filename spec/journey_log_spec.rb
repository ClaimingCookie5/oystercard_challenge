require 'journey_log'

describe JourneyLog do
  let (:station) { double(Station.new("Stockwell", 2)) }
  let (:station2) { double(Station.new("Clapham North", 3)) }

  describe '#finish' do
    it "expect #end_journey to update @exit_station" do
      jl = JourneyLog.new(journey_class: Journey)
      jl.start(station)
      jl.finish(station2)
      expect(jl.current_journey.exit_station).to eq(station2) 
    end
  end
end