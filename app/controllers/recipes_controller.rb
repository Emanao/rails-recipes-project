class RecipesController < ApplicationController
    def index
        if params[:user_id].present?
            @user = User.find_by(id: params[:user_id]) 
            @recipes = @user.recipes if !!@user
        else
            @recipes = Recipe.all.order("created_at DESC")
        end
    end
    def new
        if params[:user_id].present?
            @user = User.find_by(id: params[:user_id])
            @recipe = @user.recipes.build if !!@user
        end
    end
    def create
        user = User.find_by(id: params[:user_id]) if params[:user_id].present?
        if user
            new_recipe = user.recipes.build(recipe_params)
            if new_recipe.save
                redirect_to user_recipes_path(user)
            else
                raise params.inspect
            end
        end
    end
    def show
        @recipe = Recipe.find(params[:id])
        @user = @recipe.user
    end
    def edit
        user = User.find_by(id: params[:user_id]) if params[:user_id].present?
        if user
            recipe = user.recipes.find(params[:id])
        end
    end
    def destroy
        user = User.find(params[:user_id]) if params[:user_id].present?
        if user
            user.recipes.find(params[:id]).destroy
            redirect_to user_recipes_path user
        end
    end
    private
    def recipe_params
        params.require(:recipe).permit(:title, :description, :directions, :servings, :user_id, :ingredients_attributes=> :name)
    end
        


end
