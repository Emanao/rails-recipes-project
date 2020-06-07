class Recipe < ApplicationRecord
    validates :title, presence:true
    belongs_to :user

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def ingredients_attributes=(ingredient_attributes)
        if !ingredient_attributes[:name].strip.empty?
            ingredients_list = ingredient_attributes[:name].split(/\r\n/).reject{|il| il.strip.empty?}

            ingredients_list.each do |ingredient_list|
                ingredient = Ingredient.find_or_create_by(name:ingredient_list)
                self.recipe_ingredients.build(:ingredient=>ingredient)
            end
        end

    end
end
