require 'pry'

module LolComposer
    class Team
        attr_accessor :team

        def initialize
            @roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
            @team = {
                :top => LolComposer::Lane.new('top'),
                :jungle => LolComposer::Lane.new('jungle'),
                :mid => LolComposer::Lane.new('mid'),
                :adc => LolComposer::Lane.new('adc'),
                :support => LolComposer::Lane.new('support')
            }
        end

        def assign_lane(champ_name)
            lane_list = @roster.find_by_name(champ_name).lane
            lane_list.each do |lane|
                if @team[lane.to_sym].champ.nil?
                    return lane.to_sym
                end
            end
        end
 
        def build_rand_team
           fill_with_rand
        end

        def fill_with_rand
            @team.each_pair do |lane_name, lane|
                if lane.champ.nil?
                    fill_lane(lane_name)
                end
            end
        end

        def fill_lane(lane_name)
            @team[lane_name].champ = @roster.random_by_lane(lane_name)
        end

        def build_from_champion(champ_names)
            champ_names.each do |name|
                lane_name = assign_lane(name).to_sym
                @team[lane_name].champ = @roster.find_by_name(name)
            end
            fill_with_rand
        end

        def to_s
            s = ( team[:top].champ.name + "\n" + team[:jungle].champ.name + "\n" + team[:mid].champ.name + "\n" + 
                  team[:adc].champ.name + "\n" + team[:support].champ.name )
        end    

    end
end