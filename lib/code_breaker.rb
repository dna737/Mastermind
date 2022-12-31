class CodeBreaker
    @whites #colors that result in whites are stored in this hash.
    @blacks #colors that result in blacks are stored in this hash.
  def initialize(number)
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

  def computer
    for i in 1..12 #you have 12 rounds to figure this out

    end
  end 

  def human
    puts "\n There is a code."
  end

  #Lets us know the number of black or white pegs while breaking the code.
  def verdict  

  end

end