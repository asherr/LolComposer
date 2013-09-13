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

    it "should fetch a champion based on its role" do
        roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build)
        champs = roster.find_champ_by_role("engage")
        champs.each do |champ| puts champ.name end
    end
end