require'./lib/player'
require'./lib/team'

describe Team do

    let(:team) {Team.new("France")}
    let(:mbappe) {Player.new({name: "Kylian Mbappe", position: "forward"})}
    let(:pogba) {Player.new({name: "Paul Pogba", position: "midfielder"})}
    
    it 'can initialize' do
        expect(team).to be_an_instance_of(Team)
        expect(team.country).to eq("France")
        expect(team.players).to eq([])
    end

    it 'can determine eliminated' do
        expect(team.eliminated?).to be false

        team.eliminated = true

        expect(team.eliminated?).to be true
    end

    it 'can add players' do
        team.add_player(mbappe)
        team.add_player(pogba)

        expect(team.players).to eq([mbappe, pogba])
    end

    it 'can sort players by position' do
        team.add_player(mbappe)
        team.add_player(pogba)

        expect(team.players_by_position("midfielder")).to eq([pogba])
        expect(team.players_by_position("defender")).to eq([])

    end

end
