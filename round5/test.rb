require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_of_1_A99_is_50
		checkout = Checkout.new
		checkout.scan "A99"
		assert_equal checkout.total, 50
	end

end

class Checkout

	def scan sku
		@A99_cost = 50
		@total = @A99_cost
	end

	def total
		@total
	end
end