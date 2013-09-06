require 'pry'
module LolComposer 
    class ChampBuilder

        def self.parse
            YAML.load_file('data/champions.yml')
        end

        def self.build
            champions = parse
            roster = []
            champions.each do |key, value|
                roster << LolComposer::Champion.new(key, value["lane"], value["role"])
            end
            roster
        end

    end
end