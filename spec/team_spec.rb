require 'spec_helper'
require 'pry'

describe LolComposer::Team do

    let(:roster) { roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build) }
    
    it "should store a list of five champions" do
        team = LolComposer::Team.new
        team.top = roster.top.first
        team.jungle = roster.jungle.first
        team.mid = roster.mid.first
        team.adc = roster.adc.first
        team.support = roster.support.first

        expect(team.top.name).to eq "Aatrox"
    end

    it "should assign a lane to a champion" do
        team = LolComposer::Team.new
        team.assign_lane(roster.champs.first)

        expect(team.top.name).to eq "Aatrox"
    end
end