require_relative "amath"

pp "To begin, please enter your name:"
name = gets.chomp

amath = AMath.new(name)

amath.run
