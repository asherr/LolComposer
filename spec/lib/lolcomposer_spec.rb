module LolComposer
	class ChampBuilder
        attr_accessor :roster, :champions
		def initialize yml
			@yml = yml
            @roster = []
            parse
		end

		def parse
		    @champions = YAML.load_file(@yml)
		end

        def buildOne name
            parse
            champ = LolComposer::Champion.new
            champ.name = name
            champ.lane =  @champions.fetch(name).fetch("lane")
            champ
        end

        def build
            @champions.each do |key, value|
                @roster << LolComposer::Champion.new(key, value["lane"])
            end
            @roster
        end

	end

	class Champion
		attr_accessor :name, :lane
        def initialize name = '', lane = ''
            @name = name
            @lane = lane
        end

	end

end

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
        puts builder.roster
    end

end