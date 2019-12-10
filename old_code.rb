
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