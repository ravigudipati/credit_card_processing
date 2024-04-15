# Credit Card setup
class Card
  attr_reader :name, :number, :limit
  attr_accessor :balance

  def initialize(name, number, limit)
    @name = name
    @number = number
    @limit = limit
    @balance = 0
  end

  def is_valid?(number)
    luhn10_valid?(number)
  end

  private

  # Validate credit card number as per luhn10
  def luhn10_valid?(num)
    num = num.gsub(' ', '')
    return false unless num.match?(/^\d+$/)
 
    digits = num.chars.map(&:to_i)
    sum = 0

    digits.reverse.each_with_index do|digit, idx|
      if idx.odd?
        doubl = digit * 2
        sum += doubl > 9 ? doubl - 9 : doubl
      else
        sum += digit
      end
    end

    sum % 10 == 0
  end
end

