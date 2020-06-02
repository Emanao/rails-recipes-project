class RecipesController < ApplicationController
    def index
        if params[:user_id].present?
            user = User.find(params[:user_id])
            @recipes = user.recipes
        else
            @recipes = Recipe.all.order("created_at DESC")
        end
    end
    def new
        @recipe = Recipe.new
        @user = User.find(params[:user_id]) if params[:user_id].present? 
    end
    def create
        user = User.find(params[:user_id]) if params[:user_id].present? 
        new_recipe = user.recipes.build(recipe_params)
        if new_recipe.save
            redirect_to user_recipes_path(user)
        else
            raise params.inspect
        end

    end
    def show
        @recipe = Recipe.find(params[:id])
    end
    private
    def recipe_params
        params.require(:recipe).permit(:title, :description, :directions, :servings)
    end

end
