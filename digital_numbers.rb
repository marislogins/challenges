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
  raise "Insert integer!" unless number.is_a?(Integer)
  result = 1.upto(3).inject("") do |result, row|
    split_to_digits(number).each do |digit|
      result += convert_to_digital_number(digit, row)
    end
    result += "\n"
  end
  puts result
end

def convert_to_digital_number(digit, row)
  DIGIT_TYPES[digit][row]
end

def split_to_digits(number)
  number.to_s.split("").map(&:to_i)
end
