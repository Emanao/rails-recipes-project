class SessionsController < ApplicationController
    def new
        
    end
    def create   
        
        if !!auth_hash
            user = User.find_or_create_by_omniauth(auth_hash)
            if user
                session[:user_id] = user.id 
                redirect_to user_recipes_path user
            else
                flash[:credentials_alert] = "User not found."
                render :new
            end
        else
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
    end
    def destroy
        reset_session
        redirect_to recipes_path
    end
    private
    def auth_hash
        request.env['omniauth.auth']
      end
end
