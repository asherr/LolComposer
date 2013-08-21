module LolComposer
    class Lane
        attr_accessor :champ, :lane
        
        def initialize (lane)
            @lane = lane
        end
    end
end