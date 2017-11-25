class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      if input.size != 4
        output.puts "Try guessing a number with four digits"
      else
        input_array = input.each_char.map(&:to_i)
        secret_array = @secret_number.each_char.map(&:to_i)
        result = ''
        for i in 0..3
          for j in 0..3
              if input_array[j] == secret_array[i]
                result = '-'
              end
          end
        end
        output.puts result
     end
    end
  end
end
