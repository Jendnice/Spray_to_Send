Spray to Send (Climbing Review Site)

User
- Username
- Email
- Password
 - has_many :reviews
 - has_many :climbs through: :reviews

Location
- Name
- has_many :climbs

Climb
- Name
- Type
- Description
- location_id
- has_many :reviews
- has_many :users through: :reviews
- belongs_to :location

Reviews
- Stars
- Title
- Content
- climb_id
- user_id
- belongs_to :climb
- belongs_to :user


-----------------------------------------------------------------------


To Dos:

(see notes and project specs for all of it! :) )

**RECORD your coding session at some point!**

--Schedule project review as soon as you can--

X 1. Add additional models (review, climb, location) - as g resources (?)
   X 1a. include validations 
X 2. Build relationships between models
X 3. Add/update controllers for models (CRUD actions)
  X 3a. Sign up, Log in, Log out
X 4. Add/update views (include partials)
  X 4a. Include a user submittable attribute on the through (the "Reviews")
  X 4b. Build a nested resource (see notes)

5. Build scope method that is chainable and has url to see working feature (see notes)
7. Third party authentiction through Devise/Omniauth - Github (or Google)
8. Error messages (see notes) - do have error messages, but might need to fine-tune or add the red box around the form fields 
9. Template design and updates
10. DRY code (see spec points about this)
  10a. Helper methods 

11. Update README, MIT license, etc. (see additional lessons and docs as needed)
12. Review everything in project against spec.md file and check off/add your notes
13. Project video walkthrough 
14. Review Learn project breakdown and see if there is anything else 
15. Delete any unnecessary files and save notes file info elsewhere
    15a. Delete locations views folder if you are not using it 
16. Blog
17. Submit project :) 


Ex. rails g resource Book title:string

Review, Climb, Location


-------------------------------------------------------------------
- Add before_action (require_login and find method) in controllers

- [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [] Include third party signup/login (how e.g. Devise/OmniAuth)
- [] Include form display of validation errors (form URL e.g. /recipes/new)

- Add validations or other catches for uniqueness to avoid redundancy (ex. multiple climbs with same name)
- Update collections in views to call on instance variable (define in controller), instead of calling on all in view (Ex. Climb.all)
- Continue building out views and links for a more comprehensive and user-friendly interface (climb show views, etc.)
 

<body>
    <%= render 'layouts/nav' %>
    <%= yield %>
  </body>
</html>

