class SessionsController < ApplicationController
    def new
        
    end
    def create   
        user = User.find_by(email:params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_recipes_path user
        else
            if params[:email].strip.empty? || params[:password].empty?
                flash[:credentials_alert] = "Email or password can not be blank."
            else
                flash[:credentials_alert] = 'Email or password are incorrect.'
            end
            render :new
        end 


    end
    def destroy
        reset_session
        redirect_to recipes_path
    end
end
