require 'pry'
require 'colorize'
require './player'
require './playerdeaderror'

@players = []

@players << @player1 = Player.new("Player1")
@players << @player2 = Player.new("Player2")
@turn = 0

def generate_question
  num1 = rand(20)
  num2 = rand(20)
  @correct_answer = num1 + num2
  puts "What is #{num1} + #{num2}?".cyan
end

def user_answer
  @user_answer = gets.chomp.to_i
end

def current_player
  if @turn == 0
    @current_player = @player1
  else
    @current_player = @player2
  end
end
# binding.pry

def change_turn
  if current_player.lives > 0
    if @turn == 0
      @turn += 1
    else
      @turn -= 1
    end
  end
end

def score_up
  current_player.score += 1
end

def score_down
  if current_player.score > 0
    current_player.score -= 1
  end
end

def remove_life
  current_player.lives -= 1
end

def show_score
  puts "Player1's score: #{@player1.score}".magenta
  puts "Player2's score: #{@player2.score}".magenta
end

def reset_lives
  @player1.lives = 3
  @player2.lives = 3
end

def player_dead_error
  raise PlayerDeadError, "Player is dead!"
end

def success_message
  puts "Correct!".green
  puts "Your score: #{current_player.score}".magenta
  puts "Lives remaining: #{current_player.lives}".magenta
end

def failure_message
  puts "Wrong answer! You lose a life!".red
  puts "Your score: #{current_player.score}".magenta
  puts "Lives remaining: #{current_player.lives}".magenta
end

def out_of_lives_message
  puts "Out of lives! Game over!".on_red.blink
end

def welcome_message
  puts "Welcome to the 2 Player Math Game! Each player has 3 lives. Go!".yellow
end

def change_turn_message
  puts "#{current_player.name}'s turn!".blue
end

def play_again?
  puts "Would you like to play again? (y/n)".on_blue
  answer = gets.chomp
  if answer == "y"
    reset_lives
    play_game
  end
end

def play_game

  welcome_message

  until current_player.lives == 0

    change_turn_message
    generate_question
    user_answer

      if @user_answer == @correct_answer
        score_up
        success_message
      else
        remove_life
        score_down
        failure_message
      end

    if current_player.lives == 0
      out_of_lives_message
      # player_dead_error
    end

    change_turn

  end
  show_score
  play_again?
end

play_game