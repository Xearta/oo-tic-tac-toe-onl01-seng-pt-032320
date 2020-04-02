class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],  # Top Row
    [3,4,5],  # Middle Row
    [6,7,8],  # Bottom Row
    [0,4,8],  # Top Left to Bottom Right
    [2,4,6],  # Top Right to Bottom Left
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8]   # Right Column
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def current_player
    if turn_count.even?
      player = "X"
    else
      player = "O"
    end
    player
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) && !draw?
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    counter
  end
  
  def won?
    
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end
    end
    false
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full?
  end
    
  def winner
    if not won?
      nil
    elsif won? && turn_count.even?
      "O"
    elsif won? && turn_count.odd?
      "X"
    end
  end 
  
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
end

#game = TicTacToe.new
#game.play