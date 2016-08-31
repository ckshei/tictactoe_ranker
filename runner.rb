require 'pry'
require_relative "board.rb"
require_relative "ai.rb"

board = Board.new
ai = Ai.new
puts "Welcome to Tic Tac Toe Ranker. \nInput any board configuration, TTT-Ranker will display the best possible next move"
sleep (2)
puts "\nBelow is a blank board - the numbers correspond to the spaces"
board.display_position
puts "\nEnter a board configuration. X for X, O for O, and the respective number for the blank space."
puts "eg: 1,2,X,O,5,6,7,8,9"
input = gets.strip
input = input.split(",")
# binding.pry
input = input.map{ |x| x.to_i.to_s == x ? "" : x}

board.cells = input
board.display
best_move = ai.get_best_move(board)
token = board.current_player
puts "The best move is for #{token} to move to space #{best_move}"
ai.print_best_move(board, best_move)