require 'spec_helper'
require 'pry'

describe LolComposer::TeamBuilder do

    let (:builder) { builder = LolComposer::TeamBuilder.new }

    describe "#build_rand_team" do
        it "should create a team with one random champ per lane" do
            team = builder.build_rand_team
            puts team
        end
    end

    describe "#fill_with_rand" do

        it "should any empty lanes with champs" do
            team = LolComposer::Team.new 
            team.fill_with_rand
          #  puts team
        end
    end

    describe "#build_from_champion" do

        let(:team) { LolComposer::Team.new }

        it "should make a team from a single champion" do
            team.build_from_champion(['Swain'])
            #puts team
        end

        it "should make a team from a partially filled team" do
            team.build_from_champion(['Swain', 'Aatrox', 'DrMundo', 'Zed'])
            puts team
        end

    end

    describe "#assign_lane" do

        it "should return an empty lane for a champion" do
            comp = LolComposer::Team.new 
            comp.team[:top].champ = roster.top.first

            expect(comp.team[:top].champ.name).to eq "Aatrox"

            lane = comp.assign_lane("Swain")
            expect(lane).to eq :mid
        end
    end

    describe "#fill_lane" do

        it "should handle duplicate champions" do
            comp = LolComposer::Team.new
            comp.team[:adc].champ = roster.find_by_name('Quinn')

            expect(comp.fill_lane('adc')).not_to eq 'Quinn'
        end    
    end


    describe "#sort_by_lane" do

        it "should return a list of champs that work in a lane from a list of champions" do
            comp = LolComposer::Team.new
            mid_list = sort_by_lane(roster.build_from_single_role("mobile"), "mid")
            mid_list.each do |c| puts c.name end
        end
    end

    it "should fill a team centered around a single role" do
        comp = LolComposer::Team.new
        build_from_single_role("engage")
        puts comp
    end
end