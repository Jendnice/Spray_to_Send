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

    #******* RECORD YOUR CODING SESSION!!!!! *********

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    Figure out if coloring needs to show. (See Avi video or look up how to do it and add.)

        Delete locations in database!

- Make login/signup pages more clear and user friendly. (Once you sign up with Github you can use that as your login.
    Make sure that is clear based on how it is laid out.)
- Fix signup/login pages (mult. links for sign up with Github). And Sign Up button is a bit confusing.
- Continue building out views and links for a more comprehensive and user-friendly interface (climb show views, etc.)
- Based on what you build out in views, etc.: Update before_action (require_login and find method) in controllers
- Update "stars" in views so it shows where needed, but pluralizes appropriately.
- Seed data

- Add validations or other catches for uniqueness to avoid redundancy (ex. multiple climbs with same name)
- Update collections in views to call on instance variable (define in controller), instead of calling on all in view (Ex. Climb.all)
- Add another scope method (?) Make sure you completely understand the one you have in there! (Alphabetize?) Watch video.
- See list and specs for additionals
- template! :)



<div>
    <%= link_to "Sign in with Github", user_github_omniauth_authorize_path %>
</div>



<% if @climb.reviews.present?  %>
    <%= link_to "The Spray-down", reviews_path %> </br>
    <%= link_to "Add Spray", new_review_path %>
    <%= link_to "Review this climb", new_climb_review_path(@climb)%>
    <% else %>
    <%= link_to "The Spray-down", new_review_path %>
    <% end %>
    <% end %>

<body>
    <% if @climb %>
    <h1> Add a review for <%=@climb.location.name%> - <%= @climb.name %>!</h1> 
<% else %>
    <h1> Add a review! </h1>
<% end %>
 </body>
    

# In app/views/climbs/_form  integrate something like this (uses alphabetize?):

    <div class="form-group">
        <strong><%= f.label :climb %></strong><br>
        <%= f.collection_select :climb_id, alphebetize(Climb.all), :id, :name, :include_blank => true%> or new:
        <%= f.fields_for :climb_attributes do |climb_fields| %>
        <%= climb_fields.text_field :name %>
        <% end %>
    </div>