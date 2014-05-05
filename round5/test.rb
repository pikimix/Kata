require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_is_50_when_scan_A99
		checkout = Checkout.new
		checkout.scan( 'A99')
		assert_equal checkout.total,50
	end
end

class Checkout

	def scan sku

	end

	def total
		50
	end

end