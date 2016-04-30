#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
	def display_greeting
		Console_Screen.cls
		print "\t\t Welcome to the Ruby Number Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
		"continue."

		Console_Screen.pause
	end

	def display_instruction
		Console_Screen.cls
		puts "Instruction:\n\n"

		puts "This game randomly generates a number from 1 to 100 and "
		puts "challaenges you to identify it in as few guesses and possible "
	end

	def generate_number
		return randomNo = 1 + rand(1000)
	end

	def play_game
		number = generate_number
    # A.	Currently, the game allows players to play as many times as they wish. It does not provide any feedback
    # on how  the players are doing, however. Modify the game so that it keeps track of the number of games played
    # as well as the average number of guesses made per game.
    counter=0
		loop do
			Console_Screen.cls
			print "\nEnter your guess and press the enter key: "

			reply = STDIN.gets
			reply.chop!
			reply = reply.to_i
			if reply < 1 or reply > 1000 then
        puts "Invalid guess has been made! You entered #{reply}."
        puts "The valid guess should greater than or equal to 0 and less than or equal to 1000"
				redo # redo the ciurrent iteration of the loop
			end
      counter+=1
			if reply == number then
				Console_Screen.cls
				print "You have guessed the number! Press Enter to continue."
				Console_Screen.pause
				break
			elsif reply < number then
				Console_Screen.cls
				print "Your guess is too low! Press enter to continue."
				Console_Screen.pause
			elsif reply > number then
				Console_Screen.cls
				print "Your guess is too high! Press enter to continue."
				Console_Screen.pause
			end
      if counter==10
        puts "You tried 10 times! You lose!"
        break
      end
    end
    counter
	end

	def display_credits
		Console_Screen.cls
		puts "\t\t\Thanks you for playing the number game!!"
	end

	$noRight = 0

	Console_Screen = Screen.new

	SQ = Game.new

	SQ.display_greeting

	answer = ""

  ca=[]

	loop do
		Console_Screen.cls

		print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

		answer = STDIN.gets

		answer.chop!

		break if answer == "y" || answer == "n"
	end

	if answer == "n"

		Console_Screen.cls

		puts "Perhaps anoher time.\n\n"

	else
		SQ.display_instruction
		loop do
      ca << SQ.play_game
			Console_Screen.cls
      puts "You have played #{ca.length} times, the average number of guesses is #{ca.reduce(:+) / ca.length.to_f}"
			print "Would you like to play again? (y/n): "

			playAgain = STDIN.gets
			playAgain.chop!

			break if playAgain == "n"
		end

		SQ.display_credits

	end

end


