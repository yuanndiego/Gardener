require 'pry'

get '/my_plants' do 
    # @plants = Plant.where(user_id: current_user)
    @plants = Plant.all
    erb :my_plants
end


get '/plants/new' do
    @plants = Plant.all
    erb :add_plants
end

post '/my_plants' do
    plants_selected= params["plantSelected"]
    plants_id_array = plants_selected.map(&:to_i)
    plants_id_array.each do |plantid|
        tasks = Task.where(plant_id: plantid)
        tasks.each do |task|
            todo = Todo.new
            todo.user_id = User.first.id
            # change to current user once complete
            todo.plant_id = task.plant_id
            todo.task_id = task.id
            todo.complete = false;
            todo.save
        end
    end
end