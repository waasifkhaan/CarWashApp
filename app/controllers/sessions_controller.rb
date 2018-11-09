class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
      if logged_in? 
        redirect_to user_path(session[:user_id])
      else
        
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          session[:message] = "Invalid email/password!"
          redirect_to new_session_path
        end 
      end
    end

    def oauth
      oauth_email = request.env["omniauth.auth"]["info"]["email"]        
      if  user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id 
        redirect_to user_path(session[:user_id])
      else 
        @user = User.new(:email => oauth_email, name: "Name", age: 25,  :password => SecureRandom.hex)
        @user.save 
       
        session[:user_id] =@user.id 
        redirect_to user_path(@user.id)
      end    
    end 
    
    def destroy
      session.clear
      redirect_to root_path
      
    end
end
