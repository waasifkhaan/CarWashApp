class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        
        if logged_in?
          redirect_to user_path(session[:user_id])
        else
          
          if auth_hash = request.env["omniauth.auth"]
            oauth_email = auth_hash["info"]["email"]
           
            
            if user = User.find_by(:email => oauth_email)
              session[:user_id] = user.id 
              redirect_to user_path(session[:user_id])
            else 
              
              user = User.new(:email => oauth_email, :password => SecureRandom.hex)
              
              if user.save 
                session[:user_id] =user.id 
                redirect_to user_path(session[:user_id])
              else 
                session[:message] = "Invalid Email"
              end 
            end 
          end 
          if @user = User.find_by(email: params[:email])
            if  @user && @user.authenticate(params[:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            else
              session[:message] = "Password does not match!"
              
            end 
          else 
            session[:message] = "User does not exist!"
            # redirect_to login_path  
          end
        end
    end
        def destroy
          session.clear
          redirect_to root_path
        end
end
