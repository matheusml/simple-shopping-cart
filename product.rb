# encoding: UTF-8

class Product
	attr_accessor :products, :cart

	def self.fill_cart(products)
		new(products).fill_cart
	end

	def initialize(products)
		@products = products
		@cart = []
	end

	def fill_cart
    puts "-- Bem-vindo ao Carrinho de Compras!"

    add_product

    while true do
      puts "-> Deseja adicionar outro produto? (S/N)"
      answer = gets.chomp 
      break if (answer == 'n' || answer == 'N')
      add_product
    end

    cart
  end

  private

  def add_product
    puts "-> Digite o ID do produto que deseja adicionar:"

    json_product = product_from_json gets.chomp
    if json_product
      cart << json_product
      puts "O produto '#{cart.last['name']}' foi adicionado!"
    else
      puts "Erro: Id não encontrado :("
    end
  end

  def product_from_json(product_id)
    products.each do |p|
      return p if product_id.to_i == p["id"]
    end
    nil
  end
end