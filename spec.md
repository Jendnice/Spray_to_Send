# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project -- *Created my project using* ```rails new spray_to_send```

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- *User has_many Reviews, Climb has_many Reviews, Location has_many Climbs*

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- *Review belongs_to User, Review belongs_to Climb, Climb belongs_to Location*

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -- *User has_many Climbs through Reviews, Climb has_many Users through Reviews*

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- *User has_many Climbs through Reviews, Climb has_many Users through Reviews*

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- *The "through" part is Reviews. App users can submit:* review.stars, review.title, review.content

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -- *I have four models with validations: Climb, User, Review, Location.*

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -- *The Climb model includes two class-level ActiveRecord scope methods:*
1. Climb.search - URL: /climbs
2. Climb.grouped_ratings - URL: /climbs/grouped_ratings

- [x] Include signup (how e.g. Devise) -- *Devise*

- [x] Include login (how e.g. Devise) -- *Devise*

- [x] Include logout (how e.g. Devise) -- *Devise*

- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -- *Devise/OmniAuth (third party provider: Github)*

- [x] Include nested resource show or index (URL e.g. users/2/recipes) -- *climbs/1/reviews, climbs/1/reviews/9*

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -- *climbs/1/reviews/new*

- [x] Include form display of validation errors (form URL e.g. /recipes/new) -- *All forms display valdiation errors. Here is one URL: /reviews/new*

Confirm:
- [x] The application is pretty DRY -- *Abstracted where possible, utilized helper_methods and partials*

- [x] Limited logic in controllers -- *Utilized models for logic as much as possible*

- [x] Views use helper methods if appropriate -- *Used helper_methods for views where appropriate*

- [x] Views use partials if appropriate -- *Used partials for views where appropriate*
