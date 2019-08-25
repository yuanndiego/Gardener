require 'pry'
get '/todos' do
    redirect '/login' unless logged_in?

    #  Reference SQL
    # "SELECT tasks.name, tasks.due_date, todos.plant_id, plants.common_name, todos.user_id FROM todos INNER JOIN tasks ON tasks.id = todos.task_id INNER JOIN plants ON plants.id = todos.plant_id WHERE todos.user_id = 9 ORDER BY due_date DESC;"
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).order(due_date: :desc)
   
    session[:url] = 'todos'
    erb :to_do
end

post '/api/todos' do
    redirect '/login' unless logged_in?
    todo = Todo.find_by(id: params[:todo_id])
    if todo.complete == false
        todo = Todo.find_by(id: params[:todo_id])
        todo.complete = true
        todo.save
    else todo.complete == true
        todo = Todo.find_by(id: params[:todo_id])
        todo.complete = false
        todo.save
    end
end

get '/api/todos/complete' do
    redirect '/login' unless logged_in?
    # Need to filter todos by user id's
    content_type :json
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).where(complete: true).order(due_date: :desc)
    @todos = @todos.map { |todo| 
        {
            'task_id' => todo.task_id,
            'due_date_month' => Date::MONTHNAMES[todo.task.due_date.month][0..2],
            'due_date_day' => todo.task.due_date.day,
            'task_name' => todo.task.name,
            'plant_common_name' => todo.plant.common_name,
            'complete' => true
        }
    }
    @todos.to_json
end

get '/api/todos/incomplete' do
    redirect '/login' unless logged_in?
    # Need to filter todos by user id's
    content_type :json
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).where(complete: false).order(due_date: :desc)
    @todos = @todos.map { |todo| 
        {
            'task_id' => todo.task_id,
            'due_date_month' => Date::MONTHNAMES[todo.task.due_date.month][0..2],
            'due_date_day' => todo.task.due_date.day,
            'task_name' => todo.task.name,
            'plant_common_name' => todo.plant.common_name,
            'complete' => false
        }
    }
    @todos.to_json
end