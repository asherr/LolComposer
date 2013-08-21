require 'pry'

module LolComposer 
    class Roster
        attr_accessor :champs, :top, :jungle, :mid, :adc, :support
        def initialize(champs) 
            @champs = champs
            # @top, @jungle, @mid, @adc, @support = [], [], [], [], []
            build_lanes
        end
            
        def build_lanes 
            @top = fetch_lane('top')
            @jungle = fetch_lane('jungle')
            @mid = fetch_lane('mid')
            @adc = fetch_lane('adc')
            @support = fetch_lane('support')
        end

        def find_by_name(champ_name)
            champs.each do |champ|
                if champ.name = champ_name
                    return champ
                end
            end
        end
        
        def fetch_lane(lane) 
            champs.map { |c| c if c.lane.include?(lane) }.compact
        end

        def random_by_lane(lane)
            __send__(lane)[rand(__send__(lane).length)]
        end
    end
end