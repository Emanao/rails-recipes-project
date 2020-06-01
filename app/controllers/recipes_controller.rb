class RecipesController < ApplicationController
    def index
        if params[:user_id].present?
            @recipes = Recipe.find_by(id: "user_id")
        else
            @recipes = Recipe.all.order("created_at DESC")
        end
    end
    def new
    end
    def show
        @recipe = Recipe.find(params[:id])
    end
end
