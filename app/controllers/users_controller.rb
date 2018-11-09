class UsersController < ApplicationController

  def show
    
    if logged_in?
      if current_user.id != params[:id].to_i
        session[:message] = "you do not have access to user with id: #{params[:id]} profile !"
        redirect_to user_path(current_user) 
      end 
      @user = User.find(current_user.id)
    else
      redirect_to root_path
    end
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end 
  end

  def create
    @user = User.new(user_params)
      if @user.valid?
         @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end

    def edit 
      if logged_in?
        if current_user.id != params[:id].to_i
          session[:message] = "you do not have access to edit user with id: #{params[:id]} profile !"
          redirect_to edit_user_path(current_user) 
        else
          @user = User.find(params[:id]) 

        end
      else 
        redirect_t0 root_path 
      end 
         
    end 

    def update 
      
      @user = User.find(params[:id])
      if @user.update(user_params) 
        redirect_to user_path(@user)
      else 
        render :edit
      end  
    end 

   


  private

  def user_params
    params.require(:user).permit(:name, :email, :zipcode, :age, :password)
  end

  
end
