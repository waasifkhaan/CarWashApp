class CarwashesController < ApplicationController

    def new 
        if logged_in?  
                     
            if current_user.id != params[:user_id].to_i
              session[:message] = "you do not have access to user profile with id: #{params[:user_id]} !"
              redirect_to new_user_carwash_path(current_user) 
            else
                user = User.find(params[:user_id])
                @carwash = Carwash.new(user_id: params[:user_id])
                @detailers = Detailer.all
                @cars = user.cars 
            end
        else  
            redirect_to root_path   
        end 
    end 

    def index 
        if logged_in?            
            if current_user.id != params[:user_id].to_i
              session[:message] = "you do not have access to user with id: #{params[:user_id]} profile !"
              redirect_to user_carwashes_path(current_user) 
            else
                @user = User.find(params[:user_id]) 
            end
        else  
            redirect_to root_path       
        end 
        
    end 
    
    def show
        if logged_in?            
            if current_user.id != params[:user_id].to_i
              session[:message] = "you do not have access to user with id: #{params[:user_id]} profile !"
              redirect_to user_carwashes_path(current_user) 
            elsif !current_user.carwash_ids.include?(params[:id].to_i)
                session[:message] = "you do not have access to carwash with id: #{params[:id]}!"
                redirect_to user_carwashes_path(current_user)
            else
                @carwash = Carwash.find(params[:id]) 
            end
        else  
            redirect_to root_path       
        end 
         
    end 

    def create 
           
        @carwash = Carwash.new(carwash_params)
        @carwash.user_id = params[:user_id]
        if @carwash.save
            redirect_to user_carwash_path(params[:user_id],@carwash)
        else 
            @detailers = Detailer.all
            @cars = @carwash.user.cars
            render :new
        end     
    end 
    
    def update 
       
       
        @carwash = Carwash.find(params[:id])
             
        if @carwash.update(carwash_params)
            redirect_to user_carwash_path(params[:user_id], params[:id])   
        else   
            @carwash.user_comment = nil
            @carwash.user_rating = nil 
            @detailers = Detailer.all 
            @cars = @carwash.user.cars
            render params[:carwash][:page].to_sym          
            
        end 

    end 

    def edit
        
        @carwash = Carwash.find(params[:id])
        @detailers = Detailer.all 
        @cars = @carwash.user.cars
    end 
    def destroy 
        @carwash = Carwash.find(params[:id])
        
        session[:carwash] = carwash_delete_alert(@carwash)
        @carwash.destroy
        redirect_to user_carwashes_path(@carwash.user)
               
    end 
   

    private

    def carwash_params
      params.require(:carwash).permit(:car_id, :detailer_id, :user_rating, :user_comment, :detailer_comment)
    end
    def carwash_delete_alert(carwash)
        "#{carwash.car.model} washed by #{carwash.detailer.name} for $#{carwash.detailer.cost} DELETED on #{carwash.readable_time} "
    end 

  


end
