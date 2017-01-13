class LoginsController < ApplicationController
    
    def new
        
    end

    def create
      chef = Chef.find_by(email: params[:email])
      if chef && chef.authenticate(params[:password])
        session[:id] = chef.id
        flash[:success] = "Your have successfully logged in"
        redirect_to recipes_path
      else
        flash.now[:danger] ="Your email address or password does not match"
        render 'new'
      end
    
    end
    
    def destroy
        session[:id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
        
    end
end