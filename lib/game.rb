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

  def tick!

    next_round_live_cells = []
    next_round_dead_cells = []

    world.world_space.each do |rows|
      rows.each do |cell|
        if cell.alive && world.live_neighbours_around_cell(cell) < 2
          next_round_dead_cells << cell

        elsif cell.alive && world.live_neighbours_around_cell(cell) <= 3
          next_round_live_cells << cell

        elsif cell.alive && world.live_neighbours_around_cell(cell) >= 4
              next_round_dead_cells << cell

        elsif cell.alive == false && world.live_neighbours_around_cell(cell) == 3
          next_round_live_cells << cell
        end
      end
    end

    next_round_live_cells.each do |cell|
      cell.alive = true
    end

    next_round_dead_cells.each do |cell|
      cell.alive = false
    end
  end

end
