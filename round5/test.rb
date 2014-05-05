require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_is_50_when_scan_A99
		checkout = Checkout.new
		assert_equal checkout.total,50
	end
end

class Checkout

	def total
		50
	end

end