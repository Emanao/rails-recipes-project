class SessionsController < ApplicationController
    def new
        
    end
    def create   
        user = User.find_by(email:params[:email])
        if user && user.authenticate(params[:password])
            session[:ser_id] = user.id
            redirect_to recipes_path
        else
            raise "user could not be found"
        end 


    end
    def destroy
        reset_session
        redirect_to recipes_path
    end
end
