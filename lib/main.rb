require_relative './code_breaker.rb'
require_relative './code_maker.rb'

puts "Hello, and welcome to Mastermind!\n Please enter \"1\" to be a code maker, or \"2\" to be a code breaker."

input = gets.chomp.to_i
until input == 1 or input == 2 
  puts "Please enter \"1\" to be a code maker, or \"2\" to be a code breaker."
  input = gets.chomp.to_i
end

CodeMaker.new(input)