require 'sinatra'
require 'sinatra/reloader'
also_reload File.expand_path(__dir__, 'models/*')
also_reload File.expand_path(__dir__, 'views/*')
also_reload File.expand_path(__dir__, 'routes/*')

require 'bcrypt'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/task'
require_relative 'models/todo'

enable :sessions

after do
  ActiveRecord::Base.connection.close
end

helpers do
  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  redirect '/login' unless logged_in?
  redirect '/my_plants'
end

require_relative 'routes/plants'
require_relative 'routes/todos'
require_relative 'routes/sessions'
require_relative 'routes/users'

get '/:unknown' do
  erb :unknown_page
end