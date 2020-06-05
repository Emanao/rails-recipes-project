class Recipe < ApplicationRecord
    belongs_to :user

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def ingredients_attributes=(ingredient_attributes)
        ingredients_list = ingredient_attributes[:name].split("\n")
        ingredients_list.collect do |ingredient_list|
            ingredient = ingredient_list.split(",")[1].strip.downcase
            self.ingredients.find_or_initialize_by(name: ingredient)
        end
    end
end
