# encoding: UTF-8

require 'json'

load 'discount.rb'
load 'price.rb'
load 'product.rb'

class ShoppingCart
  attr_accessor :discounts, :products, :cart

  def self.start!
    new().start
  end

  def initialize
    discounts_json = File.read('discounts.json')
    products_json = File.read('products.json')

    @discounts = JSON.parse(discounts_json, :encoding => 'UTF-8')
    @products = JSON.parse(products_json, :encoding => 'UTF-8')
    @cart = []
  end

  def start
    cart = Product.fill_cart products
    discount = Discount.get_from_user_input discounts
    print_cart
    total_price = Price.calculate(cart, discount) 
    puts "TOTAL: #{total_price}"
  end

  private

  def print_cart
    cart.each do |product|
      puts "#{product['id']} #{product['name']} #{product['price']}"
    end
  end
end

ShoppingCart.start!