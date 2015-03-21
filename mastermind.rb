=begin
	
Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer's random code.

    Think about how you would set this problem up!
    Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!
    Now refactor your code to allow the human player to choose whether she wants to be the creator of the secret code or the guesser.
    Build it out so that the computer will guess if you decide to choose your own secret colors. Start by having the computer guess randomly (but keeping the ones that match exactly).
    Next, add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere. Feel free to make the AI even smarter.
	
=end



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
			random_code << @colors[rand(6).to_i]
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
		end

		

		return guesses
	
	end #get_guesses


end #class Game


class Player
	attr_accessor :name, :guesses
	def initialize(name)
		@name = name
		@guesses = [] 
	end
end #class Player




def play_game

	turn = 0

	g = Game.new("Goe")
	p g.colors
	p g.secret_code
	p g.player.name

	while turn < 4 do

	
	g.player.guesses = g.get_guesses
	p g.player.guesses

	turn +=1
	puts "turn : " + turn.to_s
	
	end


	
	

	
end

play_game






