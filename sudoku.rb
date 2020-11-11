# using ArrayExtensions

class Sudoku
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def rows
    grid.each { |row| row.size == row.uniq.size }
  end

  def columns
    grid.transpose.each { |row| row.size == row.uniq.size }
  end
end
