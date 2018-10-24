class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        # binding.pry
        if logged_in?
          redirect_to user_path(session[:user_id])
        else
          if @user = User.find_by(email: params[:email])
            if  @user && @user.authenticate(params[:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            else
              session[:message] = "Password does not match!"
              redirect_to login_path
            end 
          else 
            session[:message] = "User does not exist!"
            redirect_to login_path  
          end
        end
    end
        def destroy
          session.clear
          redirect_to root_path
        end
end
