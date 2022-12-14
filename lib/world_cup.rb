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
            if team.eliminated? == false
                active_players << team.players.find_all do |player|
                    player.position == position
                end
            end
        end
        active_players.flatten
    end

    def all_players_by_position
        {"forward" => forwards,
        "midfielder" => midfielders,
        "defender" => defenders
    }

    end

    def forwards
        forwards = []
        @teams.each do |team|
            forwards << team.players.find_all do |player|
                player.position == "forward"
            end
        end
        forwards.flatten
    end

    def defenders
        defenders = []
        @teams.each do |team|
            defenders << team.players.find_all do |player|
                player.position == "defender"
            end
        end
        defenders.flatten
    end

    def midfielders
        midfielders = []
        @teams.each do |team|
            midfielders << team.players.find_all do |player|
                player.position == "midfielder"
            end
        end
        midfielders.flatten
    end
end