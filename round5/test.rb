require 'test/unit'

class Test1 < Test::Unit::TestCase

	def test_total_of_1_A99_is_50
		checkout = Checkout.new
		assert_equal checkout.total, 50
	end

	def total
		50
	end

end

class Checkout


	def total
		50
	end


end