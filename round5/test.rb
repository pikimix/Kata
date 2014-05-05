require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_of_empty_basket_is_zero
		checkout = Checkout.new
		assert_equal checkout.total,0
	end

	def test_single_item_of_A99_in_basket
		checkout = Checkout.new
		checkout.scan "A99"
		assert_equal checkout.total,50
	end

	def test_multiple_items_of_A99_in_basket
		checkout = Checkout.new
		checkout.scan "A99"
		checkout.scan "A99"
		assert_equal checkout.total,100
	end

end

class Checkout

	def initialize
		@total = 0
	end 

	def scan( sku )
		@total += 50
	end

	def total
		@total 
	end
end