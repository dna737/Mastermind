# The Code maker comes up with a code that the opponent has to break.
class CodeMaker
  
  def initialize(number)
    if number == 1 #The computer has to make the code.
      computer  
    else
      human  
    end
    @code = []
    @colors = [].push("V").push("I").push("B").push("G").push("Y").push("O")
  end

  #If the computer has to make the code:
  def computer

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
    O - Orange"
    
    #Storing 4 inputs:
    until @code.size == 4
      
    end
  end

  private
  @code  
  @colors
end

CodeMaker.new(2)