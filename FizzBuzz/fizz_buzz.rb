module FizzBuzz
  class Game
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
      str = Fizz.new(number).call + Buzz.new(number).call
      str.empty? ? number.to_s : str
    end
  end

  module Definition
    attr_reader :number, :division

    def initialize(number)
      @number = number
    end

    def call
      to_s
    end

    def to_s
      check? ? self.class.name.split('::').last : ''
    end

    private

    def check?
      (number % division).equal?(0)
    end
  end

  class Fizz
    include Definition
    DIVISION = 3.freeze
    def division; DIVISION; end
  end

  class Buzz
    include Definition
    DIVISION = 5.freeze
    def division; DIVISION; end
  end
end