require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza')


#INDEX
get "/pizzas" do
 @pizzas = Pizza.all
 erb (:index)
end




#EDIT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb (:edit)
end



#NEW

get '/pizzas/new' do
  erb (:new)
end




#CREATE
post '/pizzas' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb (:create)
end


#UPDATE
put '/pizzas/:id' do
  Pizza.new(params).update
  redirect to "/pizzas"
end


#DELETE

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id]).delete
  redirect to "/pizzas"
end


#SHOW

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb (:show)
end
