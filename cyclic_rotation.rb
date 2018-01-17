#!/usr/bin/env ruby

puts "Type in digits separated by comma (start array):"
@array = gets.chomp.split(",").map(&:to_i)

puts "Type a number (rotation times):"
@number = gets.chomp.to_i

def solution(a, k)
  return a if k == 0
  1.upto(k).inject(a) do |result, rotation_step|
    result.insert(0, result.last).pop
    result
  end
end

p "Rotated array: #{solution(@array, @number)}"

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_solution
    assert_equal [9, 7, 6, 3, 8], solution([3, 8, 9, 7, 6], 3)
  end
end
