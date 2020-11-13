# frozen_string_literal: true

# Sudoku class with methods
class Sudoku
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def rows
    # grid.each { |row| row.size == row.uniq.size }
    grid
  end

  def columns
    # grid.transpose.each { |row| row.size == row.uniq.size }
    grid.transpose
  end

  def regions
    # regions on the first line
    r_1r_1c = grid.map { |ary| ary.first(3) }.first(3).flatten
    r_1r_2c = grid.map { |ary| ary.first(6).last(3) }.first(3).flatten
    r_1r_3c = grid.map { |ary| ary.last(3) }.first(3).flatten
    # regions on the middle line
    # start with the forth_region
    r_2r_1c = grid.map { |ary| ary.first(3) }.first(6).last(3).flatten
    r_2r_2c = grid.map { |ary| ary.first(6).last(3) }.first(6).last(3).flatten
    r_2r_3c = grid.map { |ary| ary.last(3) }.first(6).last(3).flatten
    # regions on the last line
    r_3r_1c = grid.map { |ary| ary.first(3) }.last(3).flatten
    r_3r_2c = grid.map { |ary| ary.first(6).last(3) }.last(3).flatten
    r_3r_3c = grid.map { |ary| ary.last(3) }.last(3).flatten
    [r_1r_1c, r_1r_2c, r_1r_3c, r_2r_1c, r_2r_2c, r_2r_3c, r_3r_1c, r_3r_2c, r_3r_3c]
  end

  def self.done_or_not(grid)
    # check if all regions are valid?
    # if true puts: truthy
    # if !rows.nil? || !columns.nil? || !regions.nil?
    if rows.each { |e| e.sort.valid? } || columns.each { |e| e.sort.valid? } || regions.each { |e| e.sort.valid? }
      'Finished!'
      # end
    else
      'Try again!'
    end
  end
end

# The Array class for adding a .valid? method ("monkey patching")
class Array
  def valid?
    # check if region, row and colomn are valid?
    # .sort == (1..9).to_a
    (1..9).to_a
    # unless rows.nil? || columns.nil? || regions.nil?
    #   true if rows.each { |e| e.sort == ok } || columns.each { |e| e.sort == ok } || regions.each { |e| e.sort == ok }
    # end
  end
end
