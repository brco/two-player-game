require 'colorize'

class Player

  attr_accessor :lives

  def initialize
    @lives = 3
  end

end

@players = []

@players[0] = Player.new
@players[1] = Player.new
@turn = 0

def generate_question
  num1 = rand(20)
  num2 = rand(20)
  @correct_answer = num1 + num2
  puts "What is #{num1} + #{num2}?"
end

def user_answer
  @user_answer = gets.chomp.to_i
end

def remove_life
  if @turn == 0
    @players[0].lives -= 1
  else 
    @players[1].lives -= 1
  end
end

def change_turn
  if @turn == 0
    @turn += 1
    puts "Player 2's turn!".blue
  else
    @turn -= 1
    puts "Player 1's turn!".blue
  end
end

def current_player
  if @turn == 0
    @current_player = @players[0]
  else
    @current_player = players[1]
  end
end

# def current_player_lives
#   current_player.lives
# end

def success_message
  puts "Correct!".green
end

def failure_message
  puts "Wrong answer! You lose a life!".red # #{current_player_lives} lives remaining
end

def out_of_lives_message
  puts "Out of lives! Game over!".red
end

def welcome_message
  puts "Welcome to the 2 Player Math Game! Each player has 3 lives. Go!".yellow
  puts "Player 1's turn!".blue
end

def play_game

  welcome_message

  until @players[0].lives == 0 || @players[1].lives == 0

    generate_question
    user_answer

      if @user_answer == @correct_answer
        success_message
      else
        failure_message
        remove_life
      end

    if @players[0].lives == 0 || @players[1].lives == 0
      out_of_lives_message  
    end

    change_turn

  end
end

play_game