require 'spec_helper'

describe LolComposer::Champion do

    let(:champ) {LolComposer::Champion.new}

    it "stores a champ name" do
        champ.name = "Aatrox"
        expect(champ.name).to eq "Aatrox"
    end

    it "stores a list of lanes" do
        champ.lane = ['top', 'jungle']
        expect(champ.lane).to eq ["top", "jungle"]
    end

end