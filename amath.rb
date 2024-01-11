class AMath

  def initialize
    @how_many = nil
  end

  def run
    loop do
      puts "\n"
      puts "Welcome to the Mental Arithmetic Math Challenge!"

      loop do
        print "How many numbers challenge would you like to do?"
        @how_many = gets.chomp.to_i
        puts "You entered: #{@how_many}"

        if @how_many < 1
          puts "Please enter a value greater than 0."
        else
          break
        end
      end

      puts "\n"

      puts "1. Addition"
      puts "2. Subtraction"
      puts "3. Multiplication"
      puts "4. Division"
      puts "5. Exit"
      print "Choose one of the above options: "
      option = gets.chomp.to_i
      puts "\n"

      case option
      when 1
          add(@how_many)
      when 2
        subtract
      when 3
        multiply
      when 4
        divide
      when 5
        puts "Thank you for visiting the Arithmetic CLI. Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def make_numbers(how_many)
    lst_r = how_many.to_i.times.map { rand(9) }
    
    return lst_r
  end
  
  def add(how_many)
    pp "+Addition+"
    
    q = make_numbers(how_many.to_i)

    pp "Add the following numbers: #{q}"
    print "Enter your answer: "
    option = gets.chomp.to_i
    puts "\n"

    puts("You entered: #{option}")
    puts("The answer should be: #{q.sum}")

    if option.to_i == q.sum
      print("Correct! =)\n")
    else
      print("Incorrect! =(\n")
    end
  end

  def subtract
    pp "Subtraction - WIP"
  end

  def multiply
    pp "Multiplication - WIP"
  end

  def divide
    pp "Division - WIP"
  end

end
