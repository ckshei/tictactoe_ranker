# TictactoeRanker

This is a very bare bones Tic Tac Toe ranker that uses the minimax algorithm to return the best next move in any board configuration. 

There is no data validation, and the program will break very easily, as the main goal of this project is to keep the code as simple as possible so as not to obscure any functionality. 

You can more details on my blog post here: http://www.shei.io/recursion-minimax-algorithm/

## Installation

run the runner.rb file to start -- ruby runner.rb

## Usage

The board is blank, with the below numbers corresponding to their respective spaces.

 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 
-----------
Enter your desired board configuration, X for X, O for O, and the respective number for the blank space.

For example, to get the board configuration found on my blog post type
X,X,O,X,O,O,7,8,9 which will return

 X | X | O 
-----------
 X | O | O 
-----------
 7 | 8 | 9 
-----------
I recommend you download the pry gem and uncomment my pry comments to look into the return values if you would like a better feel for how the minimax algorithm works.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ckshei/tictactoe_ranker.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

