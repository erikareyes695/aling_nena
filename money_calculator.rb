class MoneyCalculator

	attr_accessor :total_c, :total
	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation
    # convert to integer
    @ones = ones.to_i * 1
    @fives = fives.to_i * 5
    @tens = tens.to_i * 10
    @twenties = twenties.to_i * 20
    @fifties = fifties.to_i  * 50
    @hundreds = hundreds.to_i * 100
    @five_hundreds = five_hundreds.to_i * 500
    @thousands = thousands.to_i * 1000
    
    @total = @ones + @fives + @tens + @twenties + @fifties + @hundreds + @five_hundreds + @thousands
    
end

# add a method called 'change' that takes in a parameter of how much an item costs

def change (cost, quantity) 
	@total_change = @total - (cost.to_i * quantity.to_i) #subtract cost*quantity to the total money
	@new_total = @total_change 
	#looking for number of bills per denomination
	if @total_change >= 1000
 		thousands_change = @total_change / 1000
 		@total_change = @total_change % 1000
 	end
 	
 	if @total_change >= 500
 		five_hundreds_change = @total_change / 500
 		@total_change = @total_change % 500
 	end
 	
 	if @total_change >= 100
 		hundreds_change = @total_change / 100
 		@total_change = @total_change % 100
 	end
 	
 	if @total_change >= 50
 		fifties_change = @total_change / 50
 		@total_change = @total_change % 50
 	end
 	
 	if @total_change >= 20
 		twenties_change = @total_change / 20
 		@total_change = @total_change % 20
 	end
 	
 	if @total_change >= 10
 		tens_change = @total_change / 10
 		@total_change = @total_change % 10
 	end
 	
 	if @total_change >= 5
 		fives_change = @total_change / 5
 		@total_change = @total_change % 5
 	end
 	
 	if @total_change >= 1
 		ones_change = @total_change / 1
 		@total_change = @total_change % 1
 	end
 	
 	change = {
 		:ones => ones_change.to_i,
 		:fives => fives_change.to_i,
 		:tens => tens_change.to_i,
 		:twenties => twenties_change.to_i,
 		:fifties => fifties_change.to_i,
 		:hundreds => hundreds_change.to_i,
 		:five_hundreds => five_hundreds_change.to_i,
 		:thousands => thousands_change.to_i
 	}
 	
 	"<br /> #{change[:ones]} Php 1" "<br />#{change[:fives]} Php 5" "<br />#{change[:tens]} Php 10," "<br />#{change[:twenties]} Php 20" "<br />#{change[:fifties]} Php 50" "<br />#{change[:hundreds]} Php 100" "<br />#{change[:five_hundreds]} Php 500" "<br />#{change[:thousands]} Php 1000"
  end
end