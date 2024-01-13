class AMath
  """Generates n number of arithmetic questions that can be selected from:
      - addition
      - subtraction
      - multiplication
      - division

    initialize:
     - name (string) = user name

    Methods:
     - run = initiate app
     - make_numbers = generate a list of two random numbers
     - select_option = prompt user to select arithmetic operator(s)
     - check_ans = compare user-input with expected answer
     - add = sum two numbers
     - subtract = subtract two numbers
     - multiply = multiply two numbers
     - divide = divide one number by another
  """

  attr_reader :name, :last_score

  def initialize(name)
    """Initialize user name for the instance variable.
    """

    @name = name
  end

  def run
    """Initiate the app.
    """

    loop do
      puts "\n"
      puts "Welcome, #{@name}, to the Mental Arithmetic Math Challenge!"

      loop do
        #reset score
        @score = 0
        print "How many questions would you like to do (enter 0 to quit)?"
        @how_many = gets.chomp.to_i
        puts "You entered: #{@how_many}"

        if @how_many.to_i < 1
          if @how_many == 0
            break
          else
            puts "Please enter a value greater than 0."
          end
        else
          break
        end
      end

      if @how_many.to_i >= 1

        puts "\n"

        puts "1. Addition"
        puts "2. Subtraction"
        puts "3. Multiplication"
        puts "4. Division"
        puts "5. Mixed"
        puts "6. Return"
        print "Choose one of the above options: "
        option = gets.chomp.to_i
        puts "\n"

        count = 0
      
        # A list of arithmetic operators to randomize
        lst_operator = [method(:add), method(:subtract), method(:multiply), method(:divide)]

        while count < @how_many
          
          case option
          when 1 #add
            add
          when 2 #subtract
            subtract
          when 3 #multiply
            multiply
          when 4 #divide
            divide
          when 5 #random
            # Randomly select a function and call it
            rand_operators = lst_operator.sample
            rand_operators.call
          when 6 #Return
            break
          else
            puts "Invalid option. Please try again."
          end
          
          count+=1
        end

        if @how_many != 0 #only report score if there are at least one question.
          if @score >= @how_many.to_f/2
            if @score == @how_many.to_f
              score_feedback = "perfect"
            else
              score_feedback="passed"
            end
          else
            score_feedback = "failed"
          end

          if option >= 1 and option <= 5 #only report score as needed 
            @last_score = "#{@score}/#{@how_many} (#{score_feedback})"
            puts "You score is: #{@last_score}."
          end

        end
        
      else
        break
      end
    end
  end

  def make_numbers
    """generate an array of two numbers

      input: 
       None
      return: 
       lst_r (list) = a list of two random numbers
    """

    lst_r = 2.to_i.times.map { rand(-100..100) }
    return lst_r
  end

  def select_option(option)
    """Prompt user to select question types 

      input:
       option (string) = choose from add (1), subtract (2), multiply (3), or divide (4) 
      return:
       ans (integer) = user input from gets prompt
    """

    if option == 4
      #if division, make the product of the two random numbers the numerator so that the answer is an integer
      temp = make_numbers
      @q = [temp[0]*temp[1], temp[1]]
    else
      @q = make_numbers
    end

    pp "Operate the following numbers: #{@q}"
    print "Enter your answer: "
    ans = gets.chomp.to_i
    puts "\n"

    puts("You entered: #{ans}")

    return ans
  end
  
  def check_ans(ans, exp)
    """compare answer with expected

      input:
       ans (integer) = user input answer to the arithemtic question  
       exp (integer) = the expected answer to the arithemtic question

      return:
       None
    """

    if ans == exp
      print("Correct! =)\n")
      @score += 1
    else
      print("Incorrect! =(\n")
    end
  end

  def add
    """add two numbers and compare with user input
       set select_option to 1 for addition
      input:
       None

      return:
       None
    """

    puts "\n"
    pp "+Addition+"
    
    #get answer depending on option
    ans = select_option(1)

    #calculate expected answer
    exp = @q.sum
    puts("The answer should be: #{exp}")

    check_ans(ans, exp)

  end

  def subtract
    """Subtract two numbers and compare with user input
       set select_option to 2 for addition
       
      input:
       None

      return:
       None
    """

    puts "\n"
    pp "+Subtraction+"
    
    #get answer depending on option
    ans = select_option(2)

    #calculate expected answer
    exp = @q[0]-@q[1]
    puts("The answer should be: #{exp}")

    check_ans(ans, exp)

  end

  def multiply
    """Multiply two numbers and compare with user input
       set select_option to 3 for multiplication

      input:
       None

      return:
       None
    """

    puts "\n"
    pp "*Multiplication*"
    
    #get answer depending on option
    ans = select_option(3)

    #calculate expected answer
    exp = @q[0]*@q[1]
    puts("The answer should be: #{exp}")

    check_ans(ans, exp)

  end

  def divide
    """Divide two numbers and compare with user input
       set select_option to 4 for division
      
      input:
       None

      return:
       None
    """

    puts "\n"
    pp "/Division/"
    
    #get answer depending on option
    ans = select_option(4)

    #calculate expected answer
    exp = @q[0]/@q[1]
    puts("The answer should be: #{exp}")

    check_ans(ans, exp)

  end

end
