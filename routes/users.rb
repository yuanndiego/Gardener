require 'pry'
get '/mydetails' do 
    session[:url] = 'my_details'
    erb :mydetails
end

post '/users/:id/update' do
    
    user = User.find_by(id: params[:id]);

    


    if params[:password] != params[:confirm_password]
        session[:password_error] = 'Passwords do not match.'
    end
    if (user.email != params[:email] && params[:confirm_email] == '') || (params[:email] != params[:confirm_email] && params[:confirm_email] != '')
        session[:email_error] = 'Emails do not match.'
    end
    redirect '/mydetails' unless session[:email_error] ==  nil && session[:password_error] == nil

    if user.valid?
        if (params[:password] != nil && params[:password] != '') && (params[:confirm_password] != nil && params[:confirm_password] != '')
            user.password = params[:username]
        end
        if user.username != params[:username] && (params[:username] != nil && params[:username] != '')
            user.username = params[:username]
        end
        if user.email != params[:email] && (params[:email] != nil && params[:email] != '') && (params[:confirm_email] != nil && params[:confirm_email] != '')
            user.email = params[:email]
        end
        if user.save
            if (params[:password] != nil && params[:password] != '') && (params[:confirm_password] != nil && params[:confirm_password] != '')
                session[:password_updated] = true
            end
            if user.username != params[:username] && (params[:username] != nil && params[:username] != '')
                session[:username_updated] = true
            end
            if user.email != params[:email] && (params[:email] != nil && params[:email] != '') && (params[:confirm_email] != nil && params[:confirm_email] != '')
                session[:email_updated] = true
            end
        else
            @errors = user.errors.messages
        end
    end

    erb :mydetails
end

post '/users/:id/settings' do

    redirect '/mydetails'
end