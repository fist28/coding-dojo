require 'minitest'
require 'minitest/autorun'
require 'mutant/minitest/coverage'
require_relative "fizz_buzz"

class TestFizzBuzz < Minitest::Test
  cover 'FizzBuzz'

  def test_that_three_return_fiz
    assert_equal 'Fizz', FizzBuzz.new(3).call
  end

  def test_that_five_return_buzz
    assert_equal 'Buzz', FizzBuzz.new(5).call
  end

  def test_that_one_return_one
    assert_equal '1', FizzBuzz.new(1).call
  end

  def test_that_fifteen_return_fizzbuzz
    assert_equal 'FizzBuzz', FizzBuzz.new(15).call
  end

  def test_that_range_return_each_replaced_number
    assert_equal "1\n2\nFizz\n4\nBuzz", FizzBuzz.new(1..5).call
  end

  def test_that_wrong_value_raise_exception
    assert_raises(ArgumentError) { FizzBuzz.new('test').call }
  end

  def test_that_raise_exception_for_range_size_gather_than_1000
    assert_raises(ArgumentError) { FizzBuzz.new(100...1101).call }
  end
end
