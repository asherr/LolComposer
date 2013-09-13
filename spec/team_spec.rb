require 'spec_helper'
require 'pry'

describe LolComposer::Team do

    let(:roster) { roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build) }
    
    it "should store a list of five champions" do
        comp = LolComposer::Team.new
        comp.team[:top] = roster.top.first
        comp.team[:jungle] = roster.jungle.first
        comp.team[:mid] = roster.mid.first
        comp.team[:adc] = roster.adc.first
        comp.team[:support] = roster.support.first

        expect(comp.team[:top].name).to eq "Aatrox"
    end

    it "should create a team with one champ per lane" do
        comp = LolComposer::Team.new
        comp.build_rand_team
        #puts comp
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

    describe "#is_dupe" do

        it "should return true if champ is duplicate" do
            comp = LolComposer::Team.new
            comp.team[:adc].champ = roster.find_by_name('Quinn')

            expect(comp.is_dupe(roster.find_by_name('Quinn'))).to eq true
        end

         it "should return false if champ isn't a duplicate" do
            comp = LolComposer::Team.new
            comp.team[:adc].champ = roster.find_by_name('Aatrox')

            expect(comp.is_dupe(roster.find_by_name('Quinn'))).to eq false
        end
    end

    describe "#fill_from_list" do

        it "should create a team out of a list of champs" do
            comp = LolComposer::Team.new
            comp.fill_from_list(roster.find_by_role("mobile"))
            puts comp
        end
    end

    describe "#sort_by_lane" do

        it "should return a list of champs that work in a lane from a list of champions" do
            comp = LolComposer::Team.new
            mid_list = comp.sort_by_lane(roster.find_by_role("engage"), "mid")
            # mid_list.each do |c| puts c.name end
        end
    end

    it "should fill a team centered around a single role" do
        comp = LolComposer::Team.new
        comp.build_from_single_role("engage")
        puts comp
    end
end