class FizzBuzz
  attr_reader :range

  def initialize(input)
    @range = if input.is_a?(Integer)
               input..input
             elsif input.is_a?(Range)
               input
             end
  end

  def call
    raise ArgumentError unless range
    raise ArgumentError if range.size >= 1000
    range.map do |number|
      if number % 3 == 0 && number % 5 == 0
        'FizzBuzz'
      elsif number % 3 == 0
        'Fizz'
      elsif number % 5 == 0
        'Buzz'
      else
        number
      end
    end.join("\n")
  end
end