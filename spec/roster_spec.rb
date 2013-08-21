require 'spec_helper'
require 'pry'

describe LolComposer::Roster do
    
    it "should store the champ roster" do
        roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
    end

    it "should store the list of champs sorted by lane" do
        roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
        #puts roster.support.map(&:name)
    end

    it "should create a team with one champ per lane" do
        roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
        team = roster.build_rand_team
        #team.each { |c| puts c.name}
    end

    it "should create a team around one given champ" do
        roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
        team = roster.build_team_around('Swain')
        team.each { |c| puts c.name}
    end
end