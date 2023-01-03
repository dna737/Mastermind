class CodeBreaker
  def initialize(number, code)
    @number = number
    @code = code
    @colors = [].push('V').push('I').push('B').push('G').push('Y').push('O')
    if number == 1
      # The computer needs to break the code.
      @guaranteed = {}
      @computer_result = []
      computer
    else
      # The user needs to break the code.
      human
    end
  end

  private

  attr_accessor :user_input, :guaranteed, :computer_result
  attr_reader :code, :colors, :number

  def computer
    i = 0

    while i < 4
      curr_color = colors[rand(colors.size)]
      colors.delete(curr_color)
      comp_input = computer_helper
      if guaranteed != nil && !guaranteed.key?(curr_color)
        for j in 0..3
          remove_this = guaranteed.values
          unless guaranteed.values.flatten.include?(j)
            comp_input[j] = curr_color
          end
        end
      end
      i += 1
      if verdict(comp_input, code)
        puts "The computer guessed your code in #{i} move(s)!"
        puts "The computer's correct guess was: #{comp_input}"
        break
      else
        puts "The computer guessed it wrong. It has #{4 - i} move(s) left!"
        next
      end
    end
  end

  # This method fills in the values that previously generated black pegs.
  def computer_helper
    # new array of size 4. Only insert in indices that are stored as values in the hash.
    computer_result = Array.new(4)
    unless guaranteed.empty?
      # iterate through the hash and add the elements where you need to.
      guaranteed.each do |char, indices|
        # the index is an array of indices. Iterate through the `index` array now.
        unless indices.empty?
          for index in indices
            computer_result[index] = char
          end
        end
      end
    end
    computer_result
  end

  def human
    puts "\n There is a code. Guess it in 12 (or less) moves to win!"
    for i in 1..12 # you have 12 rounds to figure this out

      # Taking the input (4 characters):
      user_input = []
      until user_input.size == 4
        puts "Please enter a letter. #{4 - user_input.size} more left"
        puts "Your input so far: #{user_input}"
        input = gets.chomp
        if input != nil && input != '' && colors.include?(input[0].upcase)
          user_input.push(input[0])
        else
          puts "Invalid input. Please enter a valid color."
        end
        puts "You entered: #{input}"
        sleep(1.32)
        puts "\e[H\e[2J"
      end

      user_input = user_input.map { |i| i.upcase }
      puts "Your input was: #{user_input}\nFeedback:\n"
      if verdict(user_input, code)
        puts "\nCongrats! You guessed it in #{i} move(s)!"
        break
      else
        puts "\nIncorrect! Guesses remaining: #{12 - i}"
        next
      end
    end
  end

  # Lets us know the number of black or white pegs when breaking the code.
  def verdict(input, code)
    # Check the number of black pegs:
    input_clone = input.clone
    code_clone = code.clone
    black_pegs = 0
    for j in 0...input.size
      if input != nil && input[j] != nil && input[j].is_a?(String) && input[j].upcase == code[j]
        black_pegs += 1
        if number == 1 # the computer's trying to break the code.
          if guaranteed.key?(input[j])
            unless guaranteed.values.flatten.include?(j)
              guaranteed[input[j]].push(j)
            end
          else
            guaranteed[input[j]] = [].push(j)
          end
        end
        input_clone[j] = "0".to_i
        code_clone[j] = 0
      end

    end

    puts "Number of black pegs: #{black_pegs}"
    if black_pegs == 4
      return true
    end

    # Check the number of white pegs:
    white_pegs = 0

    for k in 0...input.size
      if input[k].is_a?(String) && code_clone.include?(input[k].upcase)
        white_pegs += 1
        code_clone[code_clone.find_index(input[k].upcase)] = 0
        input_clone[k] = 0
      end
    end
    puts "Number of white pegs: #{white_pegs}"
    false
  end
end
