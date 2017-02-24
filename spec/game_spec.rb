require 'game'

describe Game do

  let!(:life) {Game.new}
  let!(:world) {World.new}

  it "should start a new game" do
    expect(life.is_a?(Game)).to eql(true)
  end

  it "should respond to proper methods" do
    expect(life.respond_to?(:world)).to eql(true)
    expect(life.respond_to?(:seeds)).to eql(true)
  end

  it "should initialize properly" do
    expect(life.world.is_a?(World)).to eql(true)
    expect(life.seeds.is_a?(Array)).to eql(true)
  end

  it "should plant seeds properly" do
    game = Game.new(world, [[1, 2], [0, 2]])
    expect(game.world.world_space[1][2].alive).to eql(true)
    expect(game.world.world_space[0][2].alive).to eql(true)
    expect(game.world.world_space[1][1].alive).to eql(false)
  end



end
