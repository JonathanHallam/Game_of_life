require 'gosu'
require_relative './lib/game'
require_relative './lib/world'

class GameWindow < Gosu::Window
  def initialize(height=2000, width=1500)
    super height, width, false
    self.caption = "Game of Life"

    @height = height
    @width = width

    @background_colour = Gosu::Color.new(0xff0061ff)
    @alive_colour = Gosu::Color.new(0xff121212)
    @dead_colour = Gosu::Color.new(0xff6c7687)

    @columns = width / 10
    @rows = height / 10

    @col_width = @width / @columns
    @row_height = @height / @rows

    @world = World.new(@columns, @rows)
    @game = Game.new(@world)
    @game.world.randomly_populate



  end

  def update
    @game.tick!
  end

  def draw
    draw_quad(0, 0, @background_colour,
              @height, 0, @background_colour,
              @height, @width, @background_colour,
              0, @height, @background_colour)

    @game.world.world_space.each do |row|
      row.each do |cell|
        if cell.alive == true
          draw_quad(  cell.x * @col_width, cell.y * @row_height, @alive_colour,
                      (cell.x + 1) * @col_width - 1, cell.y * @row_height, @alive_colour,
                      (cell.x + 1) * @col_width -1, (cell.y + 1) * @row_height - 1, @alive_colour,
                      cell.x * @col_width, (cell.y + 1) * @row_height - 1, @alive_colour,
                      )
        else
          draw_quad(  cell.x * @col_width, cell.y * @row_height, @dead_colour,
                      (cell.x + 1) * @col_width - 1, cell.y * @row_height, @dead_colour,
                      (cell.x + 1) * @col_width - 1, (cell.y + 1) * @row_height - 1, @dead_colour,
                      cell.x * @col_width, (cell.y + 1) * @row_height - 1 , @dead_colour,
                      )
        end
      end
    end
  end

  def needs_cursor? ; true ; end

end

window = GameWindow.new
window.show
