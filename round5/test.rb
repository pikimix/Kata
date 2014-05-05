require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_adding_single_item_totals_up
		checkout = Checkout.new({ 'A99' => 50})
		checkout.scan 'A99'
		assert_equal checkout.total,50
	end

end

class Checkout

	def initialize products
		@products = products
	end

	def scan sku
		@total = @products[sku]
	end

	def total
		@total
	end

end
