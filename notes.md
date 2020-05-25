My Recipes project

A USER:
- can look for recipes without being register.
- a user can signup/login through my app with bcrypt or thourgh omniauth and 2 different strategies (Githun and Facebook).
- needs to signup/singin if he wants to create/edit/delete a recipe
- needs to signup/signin if he wants to add a tag to the recipe or wants to save it.


MODELS: 
USER:
- name 
- email
- password
- has_many recipes

RECIPE:
- name
- description
- instructions
- serving size
- belongs to an user
- has_many ingredients
- has_many ingredients through recipe_ingredients

INGREDIENT:
- name
- has_many recipes 
- has_many recipes through recipe_ingredients