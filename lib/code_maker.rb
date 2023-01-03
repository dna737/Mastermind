require 'pry-byebug'
require_relative 'code_breaker.rb'

# The Code maker comes up with a code that the opponent has to break.
class CodeMaker
  private attr_accessor :code, :colors
  def initialize(number)
    @code = []
    @colors = [].push('V').push('I').push('B').push('G').push('Y').push('O')
    if number == 1 
      human     #The user makes the code, and the computer has to break it.
      @code_breaker = CodeBreaker.new(1, code)
    else
      computer  #The computer makes the code, and the human has to break it.
      @code_breaker = CodeBreaker.new(2, code)
    end
  end

  private 
  #If the computer has to make the code:
  def computer
    puts "The computer is generating the code..."
    sleep (1.03)
    until code.size == 4
      code.push(colors[rand(6)])
    end
    puts "The code has been generated!"
  end

  #If the user has to make the code:
  def human
    puts "Please make your code by selecting 4 colors in an order (Repetition is allowed).
    For reference: 
    V - Violet
    I - Indigo
    B - Blue
    G - Green
    Y - Yellow
    O - Orange\n"
    
    #Storing 4 inputs:
    until code.size == 4
      puts "Please enter a letter. #{4 - code.size} more left"
      input = gets.chomp
      if input != nil && input != '' && colors.include?(input[0].upcase)
        code.push(input[0].upcase)
      else
        puts "Invalid input. Please enter a valid color."
      end
    end
    puts "Input entered!"
  end

end

