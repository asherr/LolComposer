module LolComposer
    class Champion

    attr_accessor :name, :lane, :role
        def initialize name = '', lane = '', role = ''
            @name = name
            @lane = lane
            @role = role
        end

    end
end