require 'pry'
require_relative "board.rb"

class Ai

  def get_best_move(board, depth=0, best_score={})
    return 0 if board.draw?
    # binding.pry
    return -1 if board.over?

    board.available_spaces.each do |space|
      board.update(space, board.current_player)
      # binding.pry
      best_score[space] = -1 * get_best_move(board, depth + 1, {})
      board.reset_space_at(space)
    end
    # binding.pry
    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      # binding.pry
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

  def print_best_move(board, best_move)
    token = board.current_player
    # binding.pry
    board.update(best_move, token)
    board.display
  end
end
board = Board.new
ai = Ai.new
best_move = ai.get_best_move(board)