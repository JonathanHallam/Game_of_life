require 'rules'
require 'game'

describe Rules do


  let!(:jon) {Rules.new}
  let!(:world) {World.new}


  it "should be a new instance of the rules class" do
    expect(jon.is_a?(Rules)).to eql(true)
  end

#  it "should abide by rule 1; Any live cell with fewer than two live neighbours dies, as if caused by underpopulation." do
#    game = Game.new(world, [[1, 0], [2, 0]])
#    game.tick!
#    expect(game.world.world_space[[1, 0], [2, 0]].alive).to eql(false)
#  end


end
