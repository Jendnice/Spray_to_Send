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


- Build out user home/show page for when someone signs up or logs in! (Remember you can build a partial and render that in the Devise views)
- "The Spray-down" on climb show pages (climbs/1) should link the climb reviews (climbs/1/reviews), not all reviews (/reviews)
- /reviews needs some work - formatting, links, etc.
- Add alphabetize to reviews index, and maybe to search climbs form (see below for further explanation)
- /climbs/1/reviews - see if above helps this. Can also organize this so it pulls the climb name once, and iterates through others.
- Maybe create partial for reviews index to minimize redundant code (think about what makes most sense, only view that uses it)

- Build out main home/welcome page with additional links (?) and ease of navigation (might be mostly formatting)
- Continue building out views and links for a more comprehensive and user-friendly interface (climb show views, etc.)
- Based on what you build out in views, etc.: Update before_action (require_login and find method) in controllers
- Make sure link to search for climbs is readily accessible so users check there easily before creating redundant climbs
- Add additional coloring for validation errors/messages if possible. (See Avi video or look up how to do it and add.)
- Seed data
- Additional seach features? (Ex. They search climb name and get all reviews for that climb)
- Depending on search feature, maybe make it so only one climb of the same name can be input

- Update resources/routes so they only show what they use (ex. if you do not use edit, delete, etc., have the routes reflect that)
- Add validations or other catches for uniqueness to avoid redundancy (ex. multiple climbs with same name)
- Update collections in views to call on instance variable (define in controller), instead of calling on all in view (Ex. Climb.all)
- Add another scope method (?) Make sure you completely understand the one you have in there! (Alphabetize?) Watch video.
    -Something like this for a search: scope :search, -> (query) { where("name LIKE ?", "%" + query + "%") }
- See list and specs for additionals
- template! :)

<%= render "devise/shared/links" %>

<div>
    <%= link_to "Sign in with Github", user_github_omniauth_authorize_path %>
</div>
    

# In app/views/climbs/_form  integrate something like this (uses alphabetize?): (Also in reviews view!)

    <div class="form-group">
        <strong><%= f.label :climb %></strong><br>
        <%= f.collection_select :climb_id, alphebetize(Climb.all), :id, :name, :include_blank => true%> or new:
        <%= f.fields_for :climb_attributes do |climb_fields| %>
        <%= climb_fields.text_field :name %>
        <% end %>
    </div>



# climbs index before updating: 

<% if @climb %>
<h1> The full spray-down for <%= @climb.name %>!</h1>
    <h2> Location: <%= @climb.location.name %></h2>
<% else %>
    <h1> All the spray! </h1>
<% end %>

<% if @reviews.present? %>
<ul>
<h3> Reviews: </h3> 
<% @reviews.each do |r| %>
    <li> <h4> <%= r.climb.name %> - <%= r.title %> - <%= pluralize(r.stars, "star") %> </h4> </li>
    <p> <%= r.content %> </p>
<% end %>
<ul>
<% else %>
<p> Be the change. Add the first review. </p>
<%= link_to "Add Spray", new_climb_review_path(@climb)%>
<% end %>




 