class RecipesController < ApplicationController
    def index
        if params[:user_id].present?
            @recipes = Recipe.find_by(id: "user_id")
        else
            @recipes = Recipe.all.order("created_at DESC")
        end
    end
    def new
        @recipe = Recipe.new
        @user = User.find(params[:user_id]) if params["user_id"].present? 
    end
    def create
        
    end
    def show
        @recipe = Recipe.find(params[:id])
    end
    
end
