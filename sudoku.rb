# using ArrayExtensions

# Sudoku class with methods
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

  def regions
    region_1r_1c = grid.map { |e| e.first(3) }.take(3).flatten
    region_1r_3c = grid.map { |e| e.last(3) }.take(3).flatten
    region_1r_2c = grid.reject { region_1r_1c && region_1r_3c }
  end

  def region_center
    i = 3
    region_1r_2c = []
    until i == 5
      region_1r_2c << grid.map { |e| e }
      i += 1

    end
  end
end
