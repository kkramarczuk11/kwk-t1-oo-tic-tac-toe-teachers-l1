
class TicTacToe
  def initialize(board)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8]
  ]
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, current_player)
    board[index] = current_player
  end

  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index)
      display_board(board)
    else
      turn(board)
    end
  end

  def turn_count(board)
    counter = 0
   board.each do |turns|
    counter += 1 if turns != " "
   end
   counter
  end

  def current_player(board)
    if turn_count(board).even?
      return "X"
    else
      return "O"
    end
  end

  def won?(board)
  WIN_COMBINATIONS.detect do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
      position
    elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
      position
    else
      false
    end
  end
  end

  def full?(board)
    board.all? do |cell|
    cell == "X" || cell == "O"
  end
  end

  def draw?(board)
    if !won?(board) && full?(board)
      true
    elsif !won?(board) && !full?(board)
      false
    else won?(board)
      false
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      true
    else
      false
    end
  end

  def winner(board)
   if solution = won?(board)
    board[solution.first]
   else
    nil
   end
  end

end

end
