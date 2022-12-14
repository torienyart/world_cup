class WorldCup
    attr_reader :year,
                :teams

    def initialize(year, teams)
        @year = year
        @teams = teams
    end 

    def active_players_by_position(position)
        active_players = []
        @teams.each do |team|
            # require 'pry'; binding.pry
            if team.eliminated? == false
                active_players << team.players.find_all do |player|
                    player.position == position
                end
            end
        end
        active_players.flatten
    end
end