#!/usr/bin/env ruby

# round4

require_relative "./casheir.rb"

@casheir = Casheir.new

def mode_select
	puts "Select input Mode"
	puts "1: Product Entry"
	puts "2: Deal Entry"
	if (@casheir.deals.size > 0)
		puts "3: Show Deals"
		puts "4: Remove Deal"
	end
	puts "9: Sales Mode"
	puts "0: Exit"
	gets
end

def show_deals
	puts @casheir.list_deals
end

def remove_deal
	puts @casheir.deal_skus
	puts "Please Enter the sku to remove from deals"
	sku = gets.strip.downcase
	@casheir.remove_deal( sku )
end


def product_entry
	looping = true
	while looping
		puts "Please Enter new Product SKU, or \"done\" to finish"
		sku = gets.strip.downcase
		if sku == "done"
			looping = false
		else
			puts "Please enter new Product price"
			begin 
				price = Integer(gets.strip)
				@casheir.add_product( sku, price)
			rescue
				puts "Sorry, price needs to be a number!"
			end
		end
	end
end

def deal_entry
	looping = true
	while looping 
		puts "Please enter deal SKU, or \"done\" to finish"
		sku = gets.strip.downcase
		if sku == "done"
			looping = false
		else
			puts "Please enter the number of products for the deal"
			begin 
				number = Integer(gets.strip)
			rescue
				puts "Sorry, number of products needs to be a number!"
				break
			end

			puts "Please Enter the deal price"
			begin 
				price = Integer(gets.strip)
				@casheir.add_deal( sku, number, price )
			rescue
				puts "Sorry, deal price needs to be a number!"
				break
			end
		end
	end
end

def sales
	looping = true
	while looping
		puts "Please Enter the product SKU, or total to finish the transaction"
		sku = gets.strip.downcase
		if sku == "total"
			looping = false
		else
			puts "Please Enter the number of items, or press enter for 1"
			begin 
				num = Integer(gets.strip)
			rescue
				num = 1
			end
			@casheir.add_to_basket( sku, num )
		end
	end
	@casheir.total
end

looping = true
while looping
	case mode_select.strip.downcase.split[0]
		when "1", "product"
			product_entry
		when "2", "deal"
				deal_entry
		when "3", "show"
			if (@casheir.deals.size > 0)
				show_deals
			end
		when "4", "remove"
			if (@casheir.deals.size > 0)
				remove_deal
			end
		when "9", "sales"
			sales
		when "0", "exit"
			looping = false
	end
end