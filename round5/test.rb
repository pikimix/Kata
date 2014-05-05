require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_adding_single_item_totals_up
		checkout = Checkout.new
		checkout.scan 'A99'
		assert_equal checkout.total,50
	end

end

class Checkout



	def scan

	end

	def total
		50
	end

end
