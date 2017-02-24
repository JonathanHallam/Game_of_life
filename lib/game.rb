require './lib/world'

class Game
  attr_accessor :world, :seeds
  def initialize(world=World.new, seeds=[])
    @world = world
    @seeds = seeds

    seeds.each do |seed|
      world.world_space[seed[0]][seed[1]].alive = true
    end

  end
end
