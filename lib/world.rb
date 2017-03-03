require './lib/cell'

class World
  attr_accessor :rows, :columns, :world_space
  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns
    @world_space =  Array.new(@rows) do |row|
                      Array.new(@columns) do |col|
                        Cell.new(col, row)
                      end
                    end
  end

  def live_neighbours_around_cell(cell)

    live_neighbours = []

    x = cell.x
    y = cell.y

    # => So here we're basically going around the edge of the board with 'if'
    # => statements to make sure that we don count something on the edge of
    # => the world space as having neighbours on the other side of the world

    # => The above does bring into question whether or not you could have a
    # => 3d version of this that works on a sphere

    live_neighbours << @world_space[y-1][x-1] if y != 0 && x != 0
    live_neighbours << @world_space[y-1][x] if y != 0
    live_neighbours << @world_space[y-1][x+1] if y != 0 && (x + 1) != @columns
    live_neighbours << @world_space[y][x-1] if x != 0
    live_neighbours << @world_space[y][x+1] if (x + 1) != @columns
    live_neighbours << @world_space[y+1][x-1] if (y + 1) != @rows && x != 0
    live_neighbours << @world_space[y+1][x] if (y + 1) != @rows
    live_neighbours << @world_space[y+1][x+1] if (y + 1) != @rows && (x + 1) != @columns

    a = live_neighbours.flatten.map do |seed|
      seed if seed.alive == true
    end

    a.compact.length
  end

  def live_cells
    live_cells = []
    @world_space.each do |rows|
      rows.each do |cells|
        live_cells << cells
      end
    end
    a = live_cells.flatten.map do |live|
      live if live.alive == true
    end

    a.compact

  end

  def randomly_populate
    @world_space.each do |rows|
      rows.each do |cells|
        cells.alive = [true, false].sample
      end
    end
  end


end
