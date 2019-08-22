require 'pry'
get '/login' do 
    erb :signup
end

post "/session" do
  
    user = User.find_by(email: params[:email])
   
    if user && user.authenticate(params[:password])
        
        session[:user_id] = user.id 
        redirect '/'
     else
        erb :signup
    end
    
  
  end
  delete '/session' do
    #1.destroy the session
    session[:user_id] = nil
    #2.redirect
    redirect '/signup'
  end

#   get '/createaccount' do
#     erb :signup
#   end
  
  post "/createaccount" do
      user = User.new
      user.username = params[:username]
      user.email = params[:email]
      user.password =params[:password]
      user.save

    redirect '/plants/new'
  end
  
  
  
  