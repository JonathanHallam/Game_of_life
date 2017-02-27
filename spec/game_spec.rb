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

  it "should abide by rule 1; Any live cell with fewer than two live neighbours dies, as if caused by underpopulation." do
    game = Game.new(world, [[1, 0], [2, 0]])
    game.tick!
    expect(game.world.world_space[1][0].alive).to eql(false)
    expect(game.world.world_space[2][0].alive).to eql(false)
  end

  it "should abide by rule 2; any live cell with 2 or 3 live neighbours stays alive" do
    game = Game.new(world, [[1, 0], [2, 0], [2, 1]])
    game.tick!
    expect(game.world.world_space[1][0].alive).to eql(true)
    expect(game.world.world_space[2][0].alive).to eql(true)
    expect(game.world.world_space[2][1].alive).to eql(true)
  end

  it "should abide by rule 3; any live cell with 4 or more neighbours dies" do
    game = Game.new(world, [[1, 0], [2, 0], [2, 1], [1, 1], [2, 2]])
    game.tick!
    expect(game.world.world_space[0][0].alive).to eql(false)
    expect(game.world.world_space[0][1].alive).to eql(false)
    expect(game.world.world_space[0][2].alive).to eql(false)
    expect(game.world.world_space[1][0].alive).to eql(true)
    expect(game.world.world_space[1][1].alive).to eql(false)
    expect(game.world.world_space[1][2].alive).to eql(true)
    expect(game.world.world_space[2][0].alive).to eql(true)
    expect(game.world.world_space[2][1].alive).to eql(false)
    expect(game.world.world_space[2][2].alive).to eql(true)
  end



end
