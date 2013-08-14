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
end