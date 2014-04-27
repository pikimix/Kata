# Lets see how this ruby rolls
# First real attempt, with lots of google-fu involved
# See if we can get basics of input/ output to console on this run
# Keep it basic, build up on round 2

# definitions first, errors if below
# makes sense
$product_list = Hash.new
def sales
	puts "Entering Sales"
	looping = true
	basket = []
	total = 0
	while looping
		puts "Enter a product code"
		pcode = gets.strip
		pcode = pcode == "total" ? pcode : pcode.to_sym # not sure how to add this as a one liner with above...
		if $product_list.has_key?pcode
			puts "Product #{pcode} added to basket for #{$product_list.fetch(pcode)}"
			total+= $product_list.fetch(pcode)
		end
		if pcode.downcase == "total"
			puts "Total cost of items #{total}"
			looping = false
		end
	end
end

def sku_entry
	puts "Entering SKU Entry"
	puts "Please Enter the new product code"
	newSKU = gets.strip.to_sym
	puts "Please enter the new products price"
	price = Integer(gets.strip)
	$product_list.merge!(newSKU => price)
end

def deal_entry
	puts "Entering Deal Entry"
end

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
input = gets.strip

case input.split[0].downcase
when "sales", "1"
		sales
when "sku", "9"
		sku_entry
		puts $product_list
when "deal", "0"
		deal_entry
when "exit"
	looping = false
	puts "Goodbye"
end
end