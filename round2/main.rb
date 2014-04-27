# round 2, scrap everything from before
# okay, starting to get a grip on this
# still need to figure our variable scope and access properly
# and still need to work on Hashes and .each

class Cashier

	def initialize
		@product_list = Hash.new
		@basket = Hash.new
		@sub_total = 0
		@final_total = 0
	end

	def add_to_basket( sku )
		if @product_list.has_key?(sku)
			@sub_total += @product_list[sku]
		end
		if @basket.has_key?(sku) then
			@basket[sku] += 1
		else
			@basket.merge!(sku => 1)
		end
	end

	def add_product( sku, price)
		if price.is_a?Numeric
			@product_list.merge!( sku => price )
		end
	end

	def total
		puts "Sub-total: " + @sub_total.to_s
		@basket.each do |sku, ammount|
			puts "#{ammount} of #{sku}"
		end
	end

end

class Deal

	def initialize( sku, required_number, new_price )
		@sku = sku
		@required_number = required_number
		@new_price = new_price
	end
end

c = Cashier.new

looping = true

while looping
	puts <<EOS
Welcome to the Till System
Please Select an Entry Mode from the list, or type exit to quit
1: SALES MODE
9: SKU INPUT
0: DEAL UPDATE
EOS
	puts ">>"
	input = gets.strip[0]

	unless input.nil?

	case input.downcase
	when "sales", "1"
		in_sales = true
		while in_sales
			puts "Input SKU >>"
			sku = gets.strip
			if sku.downcase == "total" 
				in_sales = false
				puts c.total
			else
				c.add_to_basket(sku.downcase.to_sym)
			end
		end	
	when "sku", '9'
		in_add_product = true
		while in_add_product
			puts "Input SKU >>"
			sku = gets.strip
			if sku.downcase == "done"
				in_add_product = false
			else
				puts "Input Item Value >>"
				price = Integer(gets.strip)
				c.add_product(sku.to_sym, price)
			end
		end
	when "exit"
		looping = false
	end
end
end