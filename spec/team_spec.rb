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
            team.build_from_champion(['Swain', 'Aatrox', 'DrMundo'])
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

end