class FizzBuzz
  attr_reader :range
  MAX_RANGE_SIZE = 1000.freeze
  FIZZ_DIVISION = 3.freeze
  BUZZ_DIVISION = 5.freeze

  def initialize(input)
    @range = if input.instance_of?(Integer)
               input..input
             elsif input.instance_of?(Range)
               input
             end
  end

  def call
    raise ArgumentError unless range
    raise ArgumentError if range.size >= MAX_RANGE_SIZE
    range.map do |number|
      if (number % FIZZ_DIVISION).equal?(0) && (number % BUZZ_DIVISION).equal?(0)
        'FizzBuzz'
      elsif (number % FIZZ_DIVISION).equal?(0)
        'Fizz'
      elsif (number % BUZZ_DIVISION).equal?(0)
        'Buzz'
      else
        number
      end
    end.join("\n")
  end
end