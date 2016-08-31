require 'pry'

class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @cells = ["X", "", "", "", "", "O", "", "", ""]
  end

  def available_spaces
    self.cells.map.with_index {|a, i| a == "" ? i+1 : nil}.compact
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def display_position
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def over?
    won? || draw?
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def winner
    if winning_combo = won?
      @winner = self.cells[winning_combo.first]
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      cells[combo[0]] == cells[combo[1]] &&
      cells[combo[1]] == cells[combo[2]] &&
      self.taken?(combo[0]+1)
    end
  end

  def reset_space_at(space)
    @cells[space-1] = ""
  end

  def draw?
    self.full? && !won?
  end

end