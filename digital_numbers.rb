#!/usr/bin/env ruby

puts "Type a number:"
@number = gets.chomp.to_i

DIGIT_TYPES = {
  1 => {1 => "   ", 2 => "  |", 3 => "  |"},
  2 => {1 => " _ ", 2 => " _|", 3 => "|_ "},
  3 => {1 => " _ ", 2 => " _|", 3 => " _|"},
  4 => {1 => "   ", 2 => "|_|", 3 => "  |"},
  5 => {1 => " _ ", 2 => "|_ ", 3 => " _|"},
  6 => {1 => " _ ", 2 => "|_ ", 3 => "|_|"},
  7 => {1 => " _ ", 2 => "  |", 3 => "  |"},
  8 => {1 => " _ ", 2 => "|_|", 3 => "|_|"},
  9 => {1 => " _ ", 2 => "|_|", 3 => " _|"},
  0 => {1 => " _ ", 2 => "| |", 3 => "|_|"},
}

def solution(number)
  result = 1.upto(3).inject("") do |result, row|
    split_to_digits(number).each do |digit|
      result += convert_to_digital_number(digit, row)
    end
    result += "\n"
  end
  result
end

def convert_to_digital_number(digit, row)
  DIGIT_TYPES[digit][row]
end

def split_to_digits(number)
  number.to_s.split("").map(&:to_i)
end

puts solution(@number)

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_solution
    assert_equal " _     _ \n _||_| _|\n|_   ||_ \n", solution(242)
  end

  def test_convert_to_digital_number
    assert_equal "|_|", convert_to_digital_number(0, 3)
  end

  def test_split_to_digits
    assert_equal [5,8,0,2], split_to_digits(5802)
  end
end
