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


X 1. Add additional models (review, climb, location) - as g resources (?)
   X 1a. include validations 
X 2. Build relationships between models
X 3. Add/update controllers for models (CRUD actions)
  X 3a. Sign up, Log in, Log out
X 4. Add/update views (include partials)
  X 4a. Include a user submittable attribute on the through (the "Reviews")
  X 4b. Build a nested resource (see notes)

X 5. Build scope method that is chainable and has url to see working feature (see notes)
X 7. Third party authentiction through Devise/Omniauth - Github (or Google)
X 8. Error messages (see notes) - do have error messages, but might need to fine-tune or add the red box around the form fields 
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

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      X  Delete locations in database!
- X Make login/signup pages more clear and user friendly. 
- X Fix signup/login pages (mult. links for sign up with Github). And Sign Up button is a bit confusing.

- X Add search feature so users can search for climbs by name
   X In climb model:
    X scope :search, -> (query) { where("name LIKE ?", "%" + query + "%") }
- X Make it so only one location of same name can be input


-X Continue building out views and links for a more comprehensive and user-friendly interface (climb show views, etc.)
   X (See below list for all options and make sure they are included where needed.)
  X      -center spacing for top headline
 X       -uniformity in h1 vs h2, etc. each page
 X       -formatting each view (spacing things out, etc.)
  X      -italicize all error messages
- XAdd capitalize anywhere grades are shown - .capitalize
- XMake sure signup with Github works then delete acct again

- Clean up code (ex. having alphabetize method in both climb and location models. Is there a better way to do this?,
  update method in reviews controller, etc.)
- Based on what you build out in views, etc.: Update before_action (require_login and find_ method) in controllers
- Update resources/routes so they only show what they use (ex. if you do not use edit, delete, etc., have the routes reflect that)

- README, etc.
- See list and specs for additionals
- Make sure you completely understand the scope method you have in there! Watch video. Read scope method article!
    scope :search, -> (query) { where("name LIKE ?", "%" + query + "%") }


current welcome page - all welcome page; links adjusted if user logged in

welcome page - overall welcome page; links/view adjusted if user logged in
home page - user home page 


Site options breakdown:
   X Add a new climb  - spray 
   X Add a new review  - spray
   X Edit a climb review - spray
   X (Delete a climb review) - spray
  X  See all climbs  - send
    X    See a climb  - send
    X    See a climb's total reviews' - send
      X  See a climb's individual review ' - send
    X    Add a new review through a climb - spray
  X  See all reviews - send
 X       See a review - send
  X  See grouped ratings for climbs - send
  X  Search for a climb - either (more send)




    <li class="background-item fadein" style="background-image: url(&quot;https://images.unsplash.com/photo-1564858763975-d99de59ee4bb?ixlib=rb-1.2.1&amp;q=99&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=2048&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjcwOTV9&quot;);"></li>


