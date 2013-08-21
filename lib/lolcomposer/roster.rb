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

        def fetch_lane(lane) 
            champs.map { |c| c if c.lane.include?(lane) }.compact
        end

        def build_rand_team
            rng = Random.new
            team = []
            team << @top.compact[rng.rand(@top.length)]
            team << @jungle.compact[rng.rand(@jungle.length)]
            team << @mid.compact[rng.rand(@mid.length)]
            team << @adc.compact[rng.rand(@adc.length)]
            team << @support.compact[rng.rand(@support.length)]
            return team
        end
    end
end