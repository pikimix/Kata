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

	def test_single_item_of_B15_in_basket
		checkout = Checkout.new
		checkout.scan "B15"
		assert_equal checkout.total,30
	end

end

class Checkout

	def initialize
		@total = 0
		@sku_of_A99 = "A99"
		@value_of_A99 = 50
		@value_of_B15 = 30
		@products = {'A99' => 50}
	end 

	def scan( sku )
		if (sku == @sku_of_A99)
			@total = @products['A99']
		else
			@total = @value_of_B15
		end
	end

	def total
		@total 
	end
end