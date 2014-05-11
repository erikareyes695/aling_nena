require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end

# ROUTES FOR ADMIN SECTION

# ROUTES FOR CUSTOMER

get '/' do
  @product = Item.all
  @random_product = @product.sample(10)
	erb :index
end

get '/about' do
	erb :about
end

get '/products' do
  @product = Item.all
	erb :products
end

get '/buy_product/:id' do
  @product = Item.find(params[:id])
  erb :buy_form
end

post '/buy_product/:id' do
	@product = Item.find(params[:id]) #hahanapin yung item
	@quantity = params[:quantity].to_i #ilan yung binili
	@cost = @product.price.to_i #price of product
	#lalagay lahat ng pera ng user sa isang variable
	@total_money = MoneyCalculator.new(params[:ones],params[:fives],params[:tens],params[:twenties],params[:fifties],params[:hundreds],params[:five_hundreds],params[:thousands])
	#compute for change
	@change_total = @total_money.change(@cost, @quantity)
	#conditions
	if @total_money.total.to_i >= (@cost * @quantity) #kapag mas malaki yung pera kaysa sa dapat babayaran
		if @product.quantity.to_i >= @quantity #kapag may laman pa
			@product.update_attributes!( #update inventory
        	quantity: @product.quantity - @quantity,
        	sold: @product.sold + @quantity)
        	
        erb :success
        else 
        	erb :fail
        end
	else
		erb :fail
	end
end

# ROUTES FOR CUSTOMER
