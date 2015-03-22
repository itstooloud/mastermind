=begin
	
Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer's random code.

    Think about how you would set this problem up!
    Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!
    Now refactor your code to allow the human player to choose whether she wants to be the creator of the secret code or the guesser.
    Build it out so that the computer will guess if you decide to choose your own secret colors. Start by having the computer guess randomly (but keeping the ones that match exactly).
    Next, add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere. Feel free to make the AI even smarter.
	
=end

require './color_and_position'
require './right_color_wrong_pos'

class Game

	attr_accessor :colors, :secret_code, :player

	def initialize(player_name)
		#array of possible colors
		@colors = %w(red blue orange green yellow pink).to_a
		#array of 5 random colors for secret code
		@secret_code = create_secret_code
		@player = Player.new(player_name)
	
	end

	def create_secret_code

		random_code = []
		4.times do 
			random_code << rand(6).to_i
		end
		return random_code
			
	end

	def get_guesses

		@colors.each_with_index do |item, index|
			print index.to_s + " - " + item + "\n"
		end
		puts "Enter 4 colors, by index:"
		guesses = gets.chomp.scan(/\d/)

		while guesses.length != 4 
			
			puts "\n"
				@colors.each_with_index do |item, index|
				print index.to_s + " - " + item + "\n"
				end
			puts "\n"
			puts "That's not the right number of selections!"
			puts "Enter 4 colors, by index:"
			guesses = gets.chomp.scan(/\d/)
		end #while, verify input

		

		return guesses
	
	end #get_guesses


end #class Game


class Player
	attr_accessor :name, :tries
	def initialize(name)
		@name = name
		@tries = {}
	end
end #class Player




def play_game(player)

	black = 0
	white = 0
	secret_code_string = ""

	turn = 1
	solved = false

	g = Game.new(player)

	puts "HELLO #{g.player.name}! Your goal is to match the stupid crap."
	puts "\n"

	g.secret_code.each do |i|
			secret_code_string += g.colors[i] + " . " 
	end
		

	while (turn < 13 && !solved) do

		g.player.tries[turn] = g.get_guesses

		puts "Turn : " + turn.to_s
		p g.player.tries[turn]

		puts "----------------------------"

		black = color_and_position(g.player.tries[turn], g.secret_code)
		white = right_color_wrong_pos(g.player.tries[turn], g.secret_code)

		if black == 4
			solved = true
			puts "GAME OVER! YOU ARE CORRECT!"
			break
		end
		puts "black tiles (correct color and position) : " + black.to_s
		puts "white tiles (correct color, wrong position) : " + white.to_s

		puts "\n"



		
	turn +=1
	end #while

	if (turn >= 13 && black == 0)
		puts "I'm sorry, you haven't guessed it."
		puts "The secret code is: " + secret_code_string
		puts "GAME OVER. LOOOOOSER"


	end


	
	

	
end #play_game

play_game("Joe Bob")






