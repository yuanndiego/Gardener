
require 'pry'
get '/login' do 
  session[:url] = 'login'
  erb :signup
end

post "/sessions" do
  user = User.find_by(username: params[:email])
  if user == nil
    user = User.find_by(email: params[:email])
  end   
    
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    redirect '/'
  else
    session[:login_error] = 'Invalid username, email or password'
    redirect '/login'
  end
end
delete '/sessions' do
  #1.destroy the session
  session[:user_id] = nil
  #2.redirect
  redirect '/login'
end

  
post "/createaccount" do
  user = User.new
  user.username = params[:username]
  user.email = params[:email]
  user.password = params[:password]
  
  user.save

  if user.valid?
    session[:user_id] = user.id 
    redirect '/plants/new'
  else
    if user.errors != nil 
      session[:signup_error] = "#{user.errors.messages.keys.join(', ')} already taken"
    end
    redirect '/login'
  end
end
  
  
  
  