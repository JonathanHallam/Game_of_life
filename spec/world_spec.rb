require 'world'

describe World do

  before(:each) do
    @pandora = World.new
  end

  it "should create a new world" do
    expect(@pandora.is_a?(World)).to eql(true)
  end

  it "should respond to proper method to proper methods" do
    expect(@pandora.respond_to?(:columns)).to eql(true)
    expect(@pandora.respond_to?(:rows)).to eql(true)
    expect(@pandora.respond_to?(:world_space)).to eql(true)
    expect(@pandora.respond_to?(:live_neighbours_around_cell)).to eql(true)
  end

  it "should create a proper cell grid on initialization" do
    expect(@pandora.world_space.is_a?(Array)).to eql(true)

    @pandora.world_space.each do |row|
      expect(row.is_a?(Array)).to eql(true)

      row.each do |col|
        expect(col.is_a?(Cell)).to eql(true)
      end
    end
  end

  it "should count the number of live neighbours that a cell has" do
    expect(@pandora.world_space[0][1].alive).to eql(false)

    @pandora.world_space[0][1].alive = true
    @pandora.world_space[0][2].alive = true
    @pandora.world_space[2][1].alive = true
    expect(@pandora.world_space[0][1].alive).to eql(true)

    expect(@pandora.live_neighbours_around_cell(@pandora.world_space[1][1])).to eql(3)
    expect(@pandora.live_neighbours_around_cell(@pandora.world_space[0][0])).to eql(1)
    expect(@pandora.live_neighbours_around_cell(@pandora.world_space[2][2])).to eql(1)
    expect(@pandora.live_neighbours_around_cell(@pandora.world_space[1][0])).to eql(2)


  end

end
