# Credit Card Processor
class CardProcessor
  def initialize
    @cards = {}
  end

  def process_cards(input)
    cmd, *args = input.chomp.split(' ')
    case cmd
    when 'Add'
      add_card(*args)
    when 'Charge'
      charge_account(*args)
    when 'Credit'
      credit_account(*args)
    else
      raise "Invalid Command: #{cmd}\n"
    end
  end

  def generate_report
    return "No report" if @cards.empty?

    @cards.each do|name,card|
      if card == 'error'
        puts "#{name}: error"
      else
        puts "#{name}: $#{card.balance}"
      end
    end
  end

  private

  def add_card(name,num,limit)
    new_card = Card.new(name,num,limit[1..-1].to_i
    if num <= 19 && new_card.is_valid?(num)
      @cards[name] = new_card
    else
      @cards[name] = 'error'
    end
  end

  def charge_account(name,amount)
    unless @cards.key?(name)
      @cards[name] = 'error'
    end
    unless @cards[name] == 'error'
      card = @cards[name]
      amount = amount[1..-1].to_i
      card.balance += amount if card.balance + amount <= card.limit
    end
  end

  def credit_account(name,amount)
    unless @cards.key?(name)
      @cards[name] = 'error'
    end
    unless @cards[name] == 'error'
      card = @cards[name]
      amount = amount[1..-1].to_i
      card.balance -= amount
    end
  end
end
