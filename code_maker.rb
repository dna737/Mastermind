# The Code maker comes up with a code that the opponent has to break.
class CodeMaker
  private attr_accessor :code, :colors
  def initialize(number)
    @code = []
    @colors = [].push('V').push('I').push('B').push('G').push('Y').push('O')
    if number == 1 #The computer has to make the code.
      computer  
    else
      human #The user makes the code.
    end
  end

  private 
  #If the computer has to make the code:
  def computer
    puts "The computer is generating the code..."
    sleep (2)
    until code.size == 4
      code.push
    end
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
      input = gets.chomp[0]
      if colors.include?(input.upcase)
        code.push(input)
      else
        puts "Invalid input. Please enter a valid color."
      end
    end
    puts "Input entered!"
  end

end

CodeMaker.new(2)