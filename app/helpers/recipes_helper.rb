module RecipesHelper
    def render_recipe_collection(partial_name, collection)
        if collection.empty?
            render :html => "<tr><td>No recipes to be displayed<t/r></td".html_safe
        else
            render :partial => "recipes/#{partial_name}", :collection => collection, as: :recipe
        end
    end
end

    