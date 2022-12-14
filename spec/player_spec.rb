require './lib/player'

describe Player do 
    it 'can initialize new player' do
        player = Player.new({name: "Luka Modric", position: "midfielder"})

        expect(player).to be_an_instance_of(Player)
        expect(player.name).to eq("Luka Modric")
        expect(player.position).to eq("midfielder")
    end


end