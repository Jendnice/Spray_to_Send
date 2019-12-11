
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