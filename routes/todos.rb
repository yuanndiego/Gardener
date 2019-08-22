require 'pry'
get '/todo' do
    
    current_user = User.first

    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).order(due_date: :desc)

   

    # "SELECT tasks.name, tasks.due_date, todos.plant_id, plants.common_name, todos.user_id FROM todos INNER JOIN tasks ON tasks.id = todos.task_id INNER JOIN plants ON plants.id = todos.plant_id WHERE todos.user_id = 9 ORDER BY due_date DESC;"

    

    erb :to_do

end

