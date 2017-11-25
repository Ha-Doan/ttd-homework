class Codebreaker
  class Game
    attr_reader :output
    ARRAY_RANGE = 0..3
    NUMBER_OF_DIGITS = 4

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      if input.size != NUMBER_OF_DIGITS
        output.puts "Try guessing a number with four digits"
      else
        @input_array = input.chars.to_a
        @secret_array = @secret_number.chars.to_a
        @result = []
        @checked_digits = []

        respond
        output.puts @result.join
     end
   end

   def respond
     for i in ARRAY_RANGE
       for j in ARRAY_RANGE
           if @input_array[j] == @secret_array[i]
             j == i ? output_plus : output_minus(@input_array[j])
             @checked_digits.push(@input_array[j])
           end
       end
     end
   end

  def output_plus
      @result.push('+')
      # put + before -
      if @result.include?('-')
        first_minus_index = @result.find_index('-')
        plus_index = @result.length - 1
        @result[first_minus_index], @result[plus_index] = @result[plus_index], @result[first_minus_index]
      end
  end

  def output_minus(digit)
    if !already_checked(digit)
      @result.push('-')
    end
  end

  def already_checked(digit)
    @checked_digits.include?(digit)
  end
end
end
