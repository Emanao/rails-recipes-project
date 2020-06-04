class RecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
        t.string :amount
        t.belongs_to :recipe, index: true, foreign_key: true
        t.belongs_to :ingredient, index: true, foreign_key: true
    end
    end
end
