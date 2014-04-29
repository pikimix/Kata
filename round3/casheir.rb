# round 3

class Casheir

	def initialize
		@basket = Hash.new
		@product_list = Hash.new
		@deals = Hash.new
	end

	def add_product( sku, price )
		@product_list.merge!( sku => price )
	end

	def add_to_basket( sku )
		if sku.is_a?( Symbol ) && @product_list.has_key?(sku)
		if @basket.has_key?sku
			@basket[sku] += 1
		else
			@basket.merge!(sku => 1 )
		end
	end
	end

	def add_deal( sku, num, price)
		puts "here!"
		#if (@product_list.has_key?(sku)	&& num > 1 && price > 0)
			@deals.merge!(sku => [num, price])
			puts @deals
		#end
	end

	def total
		sub_total = 0
		total = 0
		@basket.each do |key,val|
			if @deals.has_key?key
				total += (val / @deals[key][0]) * @deals[key][1]
				total += (val % @deals[key][0]) * @product_list[key]
				sub_total += @product_list[key] * val
			else
				total += @product_list[key] * val
				sub_total += @product_list[key] * val
			end
			puts "Saved #{sub_total - total} today!"
		end
		puts sub_total
	end

end