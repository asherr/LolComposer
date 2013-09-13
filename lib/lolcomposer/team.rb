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
            #if no good lanes are left, put the champ anywhere
            [:top, :jungle, :mid, :adc, :support].each do |lane|
                if @team[lane].champ.nil?
                    return lane
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
            champ = @roster.random_by_lane(lane_name)
            if is_dupe(champ)
                fill_lane(lane_name)
            else
                @team[lane_name.to_sym].champ = champ
            end
        end

        def is_dupe(champ)
            @team.keys.each do |lane|
                return true if @team[lane].champ == champ
            end
            false
        end

        def build_from_champion(champ_names)
            champ_names.each do |name|
                lane_name = assign_lane(name).to_sym
                @team[lane_name].champ = @roster.find_by_name(name)
            end
            fill_with_rand
        end

        def build_from_single_role(role)
            champ_list = @roster.find_by_role(role)
            fill_from_list(champ_list)
        end

        def fill_from_list (champ_list) 
            #cycle through each of the 5 lanes
            @team.keys.each do |lane|
                lane_list = []
                #fill the lane list with champions from champ list
                champ_list.each do |champ|
                    if champ.lane.include?(lane.to_s)
                        lane_list << champ
                    end
                end
                #select a random champion from lane list
                @team[lane].champ = lane_list[rand(lane_list.length)]
            end
        end

        def sort_by_lane(clist, lane)
            lane_list = []
            clist.each do |champ|
                if champ.lane.include?(lane)
                    lane_list << champ
                end
            end
            lane_list
        end

        def to_s
            s = ( team[:top].champ.name + "\n" + team[:jungle].champ.name + "\n" + team[:mid].champ.name + "\n" + 
                  team[:adc].champ.name + "\n" + team[:support].champ.name )
        end    

    end
end