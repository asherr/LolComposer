module LolComposer
    class Team
        attr_accessor :top, :jungle, :mid, :adc, :support

        def assign_lane (champ)
            __send__("#{champ.lane.first}=", champ) 
        end

    end
end