class Team
    attr_reader :country,
                :players
                
    def initialize(country)
        @country = country
        @players = []
        @eliminated = false
    end


end