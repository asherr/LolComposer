require 'spec_helper'


describe LolComposer::ChampBuilder do

    it "should parse the hash in champions.yml" do
        LolComposer::ChampBuilder.parse
    end

    it "should create a list of champions from champions.yml" do
        LolComposer::ChampBuilder.build
    end

end
