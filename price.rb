class Price
	def self.calculate(cart, discount)
		new().calculate(cart, discount)
	end

	def calculate(cart, discount)
		total_price = sum_products cart
    total_price = apply_discount(total_price, discount)
	end

	private

  def apply_discount(total_price, discount)
    if discount
      total_price = discount.apply_discount total_price
    end
    total_price
  end

  def sum_products(cart)
    total_price = 0
    cart.each do |product|
      total_price += product["price"]
    end
    total_price
  end
end