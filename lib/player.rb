class Player

    attr_reader :name, 
                :position
                
    def initialize(player_details)
        # player_details.each do |k, v|
        #     instance_variable_set(:@k, v)
        # end
        @name = player_details[:name]
        @position = player_details[:position]
    end
end