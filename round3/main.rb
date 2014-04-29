# round 3
# splitting out to separate files now, see how this goes

require_relative "./casheir.rb"
require_relative "./deal.rb"

c = Casheir.new

puts "enter new sku"
sku = gets.strip.downcase.to_sym
puts "enter price"
price = Integer( gets.strip )
c.add_product( sku, price )
puts c.add_deal( sku, 2, price*1.5)
total = false
while (total == false)
	puts "enter sales sku"
	input = gets.strip.downcase
	if (input	 == "total")
		total = true
	else
		c.add_to_basket( input.to_sym )
	end
end
c.total
