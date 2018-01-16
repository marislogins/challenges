#!/usr/bin/env ruby

puts "Type in digits separated by comma:"
@array = gets.chomp.split(",").map(&:to_i)

def solution(a)
  size = a.length
  array_indexes = (0..(size-1)).to_a
  peak_indexes = get_peaks(a, size)
  return 0 unless peak_indexes.any? 
  divisors = reversed_number_divisors(size)
  blocks = 1
  divisors.each do |val|
  	next if val > peak_indexes.length 
    el_block = size / val 
    have_peaks = true
    peak_indexes.each_slice(el_block) do |block|
      break have_peaks = false unless block.include?(true)
    end
	break blocks = val unless have_peaks == false
  end
  return blocks
end

def reversed_number_divisors(size)
  2.upto(Math.sqrt(size)).select {|i| (size % i).zero?}.inject([]) do |f, i| 
    f << i
    f << size / i unless i == size / i
    f
  end.sort { |x,y| y <=> x }
end

def get_peaks(array, size) 
  peaks = []
  array.each_with_index do |val,i|
    if i == 0 || i == array.length - 1
      peaks << false 
    else
      peaks << is_peak?(array[i-1], array[i], array[i+1])? true : false
    end 
  end
  return peaks
end

def is_peak?(first, middle ,last) 
  first < middle && middle > last
end

puts "Has exactly #{solution(@array)} peak(s)!"

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_solution
    assert_equal 3, solution([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])
  end
end
