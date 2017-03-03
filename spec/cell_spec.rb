require 'cell'

describe Cell do

  before(:each) do
    @prison = Cell.new(0, 0)
  end

  it "should be an instance of the cell class" do
    expect(@prison.is_a?(Cell)).to eql(true)
  end

  it "should respond to proper methods" do
    expect(@prison.respond_to?(:alive)).to eql(true)
    expect(@prison.respond_to?(:x)).to eql(true)
    expect(@prison.respond_to?(:y)).to eql(true)
  end

  it "should default to a dead cell" do
    expect(@prison.alive).to eql(false)
  end

end
