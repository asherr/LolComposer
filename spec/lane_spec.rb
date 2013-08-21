require 'spec_helper'



describe LolComposer::Lane do

    let(:roster) { roster = LolComposer::Roster.new(LolComposer::ChampBuilder.build) }

    it "stores a champion to a lane" do
        lane = LolComposer::Lane.new('top')
        lane.champ = roster.champs.first
        expect(lane.champ.name).to eq "Aatrox"
    end
end