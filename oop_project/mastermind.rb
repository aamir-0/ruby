Colors={:red=>1,:green=>2,:blue=>3,:yellow=>4,:white=>5,:black=>6}
print Colors
print Colors[:red]
# Colors.each do |color, value|
class Mastermind
  attr_accessor :secret_code, :guess, :attempts, :feedback
  def initialize
    @secret_code = generate_secret_code
    @guess = []
    @attempts = 0
    @feedback = []
  end
  def generate_secret_code
    colors = [:red, :green, :blue, :yellow, :white, :black]
    secret_code = []
    4.times do
      secret_code << colors.sample
    end
    secret_code
  end
    def check_guess(guess)
      feedback = []
      guess.each_with_index do |color, index|
        if color == @secret_code[index]
          feedback << :correct
        elsif @secret_code.include?(color)
          feedback << :wrong_position
        else
          feedback << :incorrect
        end
      end
      feedback
    end
    def play_game
      puts "Welcome to Mastermind! Try to guess the secret code."
      until @attempts == 10
        puts "Attempt #{@attempts + 1}: Enter your guess (4 colors from red, green, blue, yellow, white, black):"
        @guess = gets.chomp.split.map(&:to_sym)
        if @guess.length != 4 || (@guess - Colors.keys).any?
          puts "Invalid guess. Please enter 4 valid colors."
          next
        end
        @attempts += 1
        @feedback = check_guess(@guess)
        puts "Feedback: #{@feedback}"
        if @feedback.all? { |f| f == :correct }
          puts "Congratulations! You've guessed the secret code: #{@secret_code}"
          break
        end
      end
      puts "Game over! The secret code was: #{@secret_code}" unless @feedback.all? { |f| f == :correct }
    end
    def play_game2()
      print("\n")
      puts "Your are the CODE MAKER!!"
     puts "enter the combination of 4 color to make the code:"
      puts "choose from red, green, blue, yellow, white, black"
      while true
     @secret_code=gets.chomp.split.map(&:to_sym)
     if @secret_code.length==4 && (@secret_code - Colors.keys).empty?#secret_code - red, green, blue, yellow, white, black = 0
        puts "your code is #{@secret_code}"
        break
      else
        puts "invalid code, please enter 4 colors from red, green, blue, yellow, white, black"
     end
    end
    
    computer_guess = []
    10.times do |attempt|
      computer_guess = Colors.keys.sample(4)
      puts "Computer's guess: #{computer_guess}"
      feedback = check_guess(computer_guess)
      puts "Feedback: #{feedback}"
      if feedback.all? { |f| f == :correct }
        puts "Computer guessed the secret code: #{@secret_code}"
        break
      end
     
    end
  end
end

game=Mastermind.new
puts "To choose Codemaker press 1 or to choose Guesser press 2"
      n=gets.chomp
      case n 
        
      when "1"
        game.play_game2()
      when "2"
        game.play_game()
      else
        puts "invalid input"
      end


