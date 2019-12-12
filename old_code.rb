
Spray to Send (Climbing Review Site) - Project info, breakdown, notes, and old code:

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


Scope methods:
    #write the scope method
    #custom route
    #controller method
    #view 


-----------------------------------------------------------------------

####### OLD CODE ##########


Right after "All the Spray!"
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
<% end %>




<h3> Reviews: </h3> 

<% @climbs.each do |c| %>
  <%  if c.reviews.present? %>

        <ul>
        <% c.reviews.each do |r| %>
            <li> <h4> <%= r.climb.name %> - <%= r.title %> - <%= pluralize(r.stars, "star") %> </h4> </li>
            <p> <%= r.content %> </p>
        <% end %>
        </ul>
<% end %>
<% end %>
<% end %>


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


----------------------------------------------------------------------------------


<%= render "devise/shared/links" %>

<div>
    <%= link_to "Sign in with Github", user_github_omniauth_authorize_path %>
</div>



Reviews Edit form:

<%= render partial: 'layouts/errors', locals:{object: @review}%>

    <h1> Edit Spray for <%=@review.climb.name%>!</h1>

 
<%= form_for(@review) do |f| %>

<% if params[:climb_id] %>
    <%= f.hidden_field :climb_id %>
<% else %>
    <div>
        <%= f.label :climb_id, "Select a climb!" %>
        <%= f.collection_select :climb_id, @climbs, :id, :name, include_blank: true %>
    </div>
    <% end %>
<div>
    <%= f.label :stars %>
    <%= f.number_field :stars, min:1, max:5 %>
</div>

<div>
    <%= f.label :title %>
    <%= f.text_field :title %>
</div>

<div>
    <%= f.label :content %>
    <%= f.text_area :content %>
</div>

<%= f.submit %>

<% end %>




Reviews New form:

<%= render partial: 'layouts/errors', locals:{object: @review}%>
<% if @climb %>
    <h1> Add spray to <%=@climb.name%>!</h1>
<% else %>
    <h1> Add spray! </h1>
<% end %>
 
<%= form_for(@review) do |f| %>
<% if params[:climb_id] %>
    <%= f.hidden_field :climb_id %>
<% else %>
    <div>
        <%= f.label :climb_id, "Select a climb!" %>
        <%= f.collection_select :climb_id, @climbs, :id, :name, include_blank: true %>
    </div>
    <% end %>
<div>
    <%= f.label :stars %>
    <%= f.number_field :stars, min:1, max:5 %>
</div>

<div>
    <%= f.label :title %>
    <%= f.text_field :title %>
</div>

<div>
    <%= f.label :content %>
    <%= f.text_area :content %>
</div>

<%= f.submit %>

<% end %>


---------------------------------------------------------------

layouts-application-html

<!DOCTYPE html>
<html>
  <head>

    <title>SprayToSend</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>

  </head>

  <body>

    <div>
    <%= render 'layouts/alerts' %>
    <%= render 'layouts/nav' %>
    <%= yield %>
    </div>

  </body>
</html>

----------------------------------------------------------

In reviews controller:

    def review
        @review = Review.find_by_id(params[:id])
        unless !(@review == nil)
            redirect_to reviews_path
        end 
    end



    def update
        if review_params.present? && review_params[:climb_id].present?
         @review.update(review_params)
             if @review.save
             flash[:message] = "'#{@review.title}' has been updated!"
             redirect_to review_path(@review)
             else
              climbs
              render :edit
             end
       else
        flash[:message] = "Your spray is missing some necessary content! Please try again."
        climbs
        render :edit
       end
    end
