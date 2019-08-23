
require 'pry'
get '/login' do 
    erb :signup
end

post "/sessions" do
  
    user = User.find_by(email: params[:email])
   
    if user && user.authenticate(params[:password])
        
        session[:user_id] = user.id 
        redirect '/'
     else
        erb :signup
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
      end

      erb :signup

  end
  
  
  
  