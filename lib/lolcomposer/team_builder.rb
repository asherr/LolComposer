require 'pry'

module LolComposer
    class TeamBuilder
        attr_accessor :team

        def initialize
            @roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
        end

        def assign_lane(champ_name)
            lane_list = @roster.find_by_name(champ_name).lane
            lane_list.each do |lane|
                if @team[lane.to_sym].champ.nil?
                    return lane.to_sym
                end
            end
            #if no good lanes are left, put the champ anywhere
            [:top, :jungle, :mid, :adc, :support].each do |lane|
                if @team[lane].champ.nil?
                    return lane
                end
            end
        end
 
        def build_rand_team
            team = LolComposer::Team.new
            fill_with_rand(team)
            team
        end

        def fill_with_rand(team)
            team.team.each_pair do |lane_name, lane|
                if lane.champ.nil?
                    fill_lane(lane_name) 
                end
            end
        end

        def fill_lane(lane_name)
            champ = @roster.random_by_lane(lane_name)
            if is_dupe(champ)
                fill_lane(lane_name)
            else
                @team[lane_name.to_sym].champ = champ
            end
        end

        def build_from_champion(champ_names)
            champ_names.each do |name|
                lane_name = assign_lane(name).to_sym
                @team[lane_name].champ = @roster.find_by_name(name)
            end
            fill_with_rand
        end

        def build_from_single_role(role)
            champ_list = @roster.find_champ_by_role(role)
            mid_list = sort_by_lane(champ_list, "mid")
            #TODO FINISH
        end

        def sort_by_lane(clist, lane)
            #TODO FINISh
        end

    end
end