require 'journey_log'
require 'journey'
require 'station'

describe JourneyLog do
  let (:station) { double(Station.new("Stockwell", 2)) }
  let (:station2) { double(Station.new("Clapham North", 3)) }

  # describe "#start" do

    # it "expect #start to update #in_journey" do
    #   jl = JourneyLog.new(journey_class: Journey)
    #   jl.start(station)
    #   expect(jl.current_journey.in_journey?).to eq(true) 
    # end

    # it "records the entry station of the journey" do
    #   jl = JourneyLog.new(journey_class: Journey)
    #   jl.start(station)
    #   expect(jl.current_journey.entry_station).to eq(station)
    # end

    it "records when a journey has begun" do
      jl = JourneyLog.new(journey_class: Journey)
      jl.start(station)
      jl.finish(station2)
      expect(jl.journeys.first.entry_station).to eq(station)
    end

    it "records when a journey has finished" do
      jl = JourneyLog.new(journey_class: Journey)
      jl.start(station)
      jl.finish(station2)
      expect(jl.journeys.first.exit_station).to eq(station2)
    end

    it "stores a whole journey" do
      jl = JourneyLog.new(journey_class: Journey)
      jl.start(station)
      jl.finish(station2)
      expect(jl.journeys.last).to be_a(Journey)
    end

    it "stores a list of several journeys" do
      jl = JourneyLog.new(journey_class: Journey)

      3.times do
        jl.start(station)
        jl.finish(station2)
      end

      expect(jl.journeys.size).to eq(3)
    end
  # end

  # describe '#finish' do

  # it "expect #end_journey to update @exit_station" do
  #   jl = JourneyLog.new(journey_class: Journey)
  #   jl.start(station)
  #   jl.finish(station2)
  #   expect(jl.current_journey.exit_station).to eq(station2) 
  #   end
    
  # end
end