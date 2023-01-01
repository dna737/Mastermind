class CodeBreaker
  private attr_accessor :user_input, :whites, :blacks
  private attr_reader :code
  def initialize(number, code)
    @code = code
    @colors = [].push('V').push('I').push('B').push('G').push('Y').push('O')
      if number == 1
        #The computer needs to break the code.
        @whites = {}
        @blacks = {}
        computer
      else 
        #The user needs to break the code.
        @user_input = [] 
        human 
      end
  end

  def computer

  end 

  def human
    puts "\n There is a code. Guess it in 12 (or less) moves to win!"
    for i in 1..12 #you have 12 rounds to figure this out
      until user_input.size == 4
        puts "Please enter a letter. #{4 - user_input.size} more left"
        input = gets.chomp[0]
        if colors.include?(input.upcase)
          user_input.push(input)
        else
          puts "Invalid input. Please enter a valid color."
        end
      end
      if verdict(input, code)
        puts "\nCongrats! You guessed it in #{i} move(s)!"
        break
      else
        puts "\nIncorrect! Guesses remaining: #{12-i}"
      end
      user_input = []
    end
  end

  #Lets us know the number of black or white pegs while breaking the code.
  def verdict(input, code)  
    #Check the number of black pegs:
    black_pegs = 0
    for j in 0...input.size
      if input[j] == code[j] && input[j].is_a? Numeric
        black_pegs += 1
        input[j] = "x"
      end
    end
    
    puts "Number of black pegs: #{black_pegs}"
    return true if black_pegs == 4
        
    #Check the number of white pegs:
    white_pegs = 0
    code_copy = code.clone
    for k in 0...input.size
      if input[k].is_a? Numeric && code_copy.include?(input[k])
        white_pegs += 1
        code_copy[code_copy.find_index(input[k])] = "W"
      end
  end

  puts "Number of white pegs: #{white_pegs}"
  false 

end