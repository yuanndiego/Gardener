require 'pry'

get '/my_plants' do 
    @plants = Plant.all
    erb :my_plants
end


get '/plants/new' do
    @plants = Plant.all
    erb :add_plants
end

post '/my_plants' do
  
end