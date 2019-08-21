require 'sinatra'
require 'sinatra/reloader'
also_reload File.expand_path(__dir__, 'models/*')
also_reload File.expand_path(__dir__, 'views/*')
also_reload File.expand_path(__dir__, 'routes/*')

require 'bcrypt'
require_relative 'database_config'

enable :sessions

helpers do
  def loggedIn?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  erb :index
end

require_relative 'routes/plants'
require_relative 'routes/todos'
require_relative 'routes/sessions'

