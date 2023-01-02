class CodeBreaker
  private attr_accessor :user_input, :whites, :blacks
  private attr_reader :code, :colors
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
        human 
      end
  end

  # def initialize(input, code, something)
  #   #This is for testing purposes only:
  #   @user_input = []
  #   verdict(input, code)
  # end

  def computer

  end 

  def human
    puts "\n There is a code. Guess it in 12 (or less) moves to win!"
    for i in 1..12 #you have 12 rounds to figure this out

      #Taking the input (4 characters):
      user_input = []
      until user_input.size == 4
        puts "Please enter a letter. #{4 - user_input.size} more left"

        input = gets.chomp
        if input != nil && input != '' && colors.include?(input[0].upcase)
          user_input.push(input[0])
        else
          puts "Invalid input. Please enter a valid color."
        end
      end
      
      user_input = user_input.map{|i| i.upcase}
      if verdict(user_input, code)
        puts "\nCongrats! You guessed it in #{i} move(s)!"
        break
      else
        puts "\nIncorrect! Guesses remaining: #{12-i}"
        next  
      end
    end
  end

  #Lets us know the number of black or white pegs when breaking the code.
  def verdict(input, code)  
    #Check the number of black pegs:
    black_pegs = 0
    for j in 0...input.size
      if input != nil && input[j] != nil && input[j].is_a?(String) && input[j].upcase == code[j]  
        black_pegs += 1
        input[j] = "0".to_i
      end
    end
    
    puts "Number of black pegs: #{black_pegs}"
    puts "the code is #{code}"
    if black_pegs == 4 
      return true 
    end
        
    #Check the number of white pegs:
    white_pegs = 0
    code_copy = code.clone
    for k in 0...input.size
      if input[k].is_a?(String) && code_copy.include?(input[k].upcase)
        white_pegs += 1
        code_copy[code_copy.find_index(input[k].upcase)] = 0
      end
    end
    puts "Number of white pegs: #{white_pegs}"
    user_input = []
    false 
  end
end