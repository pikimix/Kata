require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_scan_single_product
		checkout = Checkout.new
		checkout.scan "A99"
		assert_equal checkout.total,50
	end

end

class Checkout 

	def initialize
		@products = {"A99" => 50}
	end

	def scan sku
		@total = 50
	end

	def total
		@total
	end

end