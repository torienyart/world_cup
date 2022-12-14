require'./lib/player'
require'./lib/team'
require'./lib/world_cup'

describe WorldCup do


    let(:france) {Team.new("France")}
    let(:mbappe) {Player.new({name: "Kylian Mbappe", position: "forward"})}
    let(:pogba) {Player.new({name: "Paul Pogba", position: "midfielder"})}

    let(:croatia) {Team.new("Croatia")}
    let(:vida) {Player.new({name: "Domagoj Vida", position: "defender"})}
    let(:modric) {Player.new({name: "Luka Modric", position: "midfielder"})}

    let(:world_cup) {WorldCup.new(2018, [france, croatia])}

    it 'can initialize' do
        expect(world_cup).to be_an_instance_of(WorldCup)
        expect(world_cup.year).to eq(2018)
        expect(world_cup.teams).to eq([france, croatia])
    end

    it 'can sort active players by position' do
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia.add_player(modric)
        croatia.add_player(vida)

        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
        
        croatia.eliminated = true

        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    end

    it 'can sort all players by position' do
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia.add_player(modric)
        croatia.add_player(vida)

        expect(world_cup.all_players_by_position).to eq({
            "forward" => [mbappe],
            "midfielder" => [pogba, modric],
            "defender" => [vida]
        })
    end

end
