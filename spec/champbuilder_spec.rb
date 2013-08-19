require 'spec_helper'

describe LolComposer::ChampBuilder do

    let(:builder) {LolComposer::ChampBuilder.new 'data/champions.yml'}

    it "reads the champions.yml into a hash" do
        builder.champions
    end

    it "builds a champion object from champions.yml" do
        champ = builder.buildOne 'Aatrox'
        expect(champ.name).to eq 'Aatrox'
        #puts champ.lane
    end

    it "builds every champ" do
        builder.build
        #3puts builder.roster
    end

end