require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_of_empty_basket_is_zero
		checkout = Checkout.new({})
		assert_equal checkout.total,0
	end

	def test_single_item_of_B15_in_basket
		products = {'B15' => 30}
		checkout = Checkout.new(products)
		checkout.scan "B15"
		assert_equal checkout.total,30
	end

end

class Checkout

	def initialize(products)
		@total = 0
		@products = products 
	end 

	def scan( sku )
		@total = @products[sku]
	end

	def total
		@total 
	end
end