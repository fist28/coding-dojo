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
      replace(number)
    end.join("\n")
  end

  private

  def replace(number)
    if fizz(number) && buzz(number)
      'FizzBuzz'
    elsif fizz(number)
      'Fizz'
    elsif buzz(number)
      'Buzz'
    else
      number
    end
  end

  def buzz(number)
    (number % BUZZ_DIVISION).equal?(0)
  end

  def fizz(number)
    (number % FIZZ_DIVISION).equal?(0)
  end
end