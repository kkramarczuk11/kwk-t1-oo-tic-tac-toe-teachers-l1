
class TicTacToe
  def initialize(board = nil)
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

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(index)
      move(index, current_player)
      display_board(board)
    else
      turn
    end
  end

  def turn_count
    counter = 0
   @board.each do |i|
     if i == "X" || i == "O"
         counter += 1
       end
  end
  counter
end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?(board)
  WIN_COMBINATIONS.detect do |position|
    if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
      position
    elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
      position
    else
      false
    end
  end
  end

  def full?(board)
    @board.all? do |cell|
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
    @board[solution.first]
   else
    nil
   end
  end

  def play(board)
      until over?
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
   end
end
