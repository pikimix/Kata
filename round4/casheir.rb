# round4

class Casheir

	attr_reader :deals

	def initialize
		@basket = Hash.new
		@product_list = Hash.new
		@deals = Hash.new
	end

	def add_product( sku, price )
		@product_list.merge!(sku => price)
	end

	def add_deal( sku, num, new_price)
		@deals.merge!( sku => [num, new_price])
	end

	def remove_deal( sku )
		puts "Deleting deal for #{sku}"
		@deals.delete( sku )
	end

	def list_deals
		output = ""
		@deals.each do | sku, val |
			output += "\nItem : #{sku}\n"
			output += "Ammount for deal : #{val[0]}\n"
			output += "Deal Price: #{val[1]}\n"
		end
		output += "\n"
	end

	def deal_skus
		output = ""
		@deals.each do | sku, val |
			output += "Item : #{sku}\n"
		end
		output += "\n"
	end

	def add_to_basket( sku, num )
		if @product_list.has_key?sku
			if @basket.has_key?sku
				@basket[sku] += num
			else
				@basket.merge!( sku => num )
			end
			puts "You have #{@basket[sku]} of #{sku} in your basket \n"
		else
			puts "Product not on file"
		end
	end

	def total
		total = 0
		sub_total = 0
		@basket.each do | sku, ammount |
			if @deals.has_key?sku 
				total += (ammount / @deals[sku][0]) * @deals[sku][1]
				total += (ammount % @deals[sku][0]) * @product_list[sku]
				sub_total += ammount * @product_list[sku]
			else
				total += @product_list[sku] * @basket[sku]
				sub_total += @product_list[sku] * @basket[sku]
			end
		end
		if total == sub_total
			puts "Total shop today of #{total}"
		else
			puts "Total shop today of #{total} with a saving of #{(total - sub_total).abs}"
		end
		@basket = Hash.new
	end
end