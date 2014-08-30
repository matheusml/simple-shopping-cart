# encoding: UTF-8

class Discount
  attr_accessor :code, :type, :amount
  
  def initialize(code, type, amount)
    @code = code
    @type = type
    @amount = amount
  end

  def apply_discount(total_price)
  	if self.type == 'percentage'
      total_price = total_price - ((total_price * self.amount) / 100)
      puts "Descontos: -#{self.amount}%"
    else
      total_price = total_price - self.amount
      puts "Descontos: -#{self.amount}"
    end
    total_price
  end

  def self.get_from_user_input(discounts)
    puts "-> Deseja adicionar um cupom de desconto (S/N)"
    discount_answer = gets.chomp
    
    if (discount_answer == 's' || discount_answer == 'S')
      puts "-> Digite o código do cupom (S/N)"
      discount_cupom = gets.chomp
      discount = discounts_from_json(discounts, discount_cupom)
    end

    if discount
      Discount.new(discount['code'], discount['type'], discount['amount'])
    else
      nil
    end
  end

  def self.discounts_from_json(discounts, discount_code)
    discounts.each do |d|
      return d if discount_code == d["code"]
    end
    nil
  end
end