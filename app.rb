require_relative "amath"

pp "To begin, please enter your name:"
name = gets.chomp

amath = AMath.new(name)

amath.run

puts "\n"

#remember to add @ before last_score and name to be accessible.
puts "Thank you, #{amath.name}, for playing! Your last score was #{amath.last_score}. I will see you soon!"
