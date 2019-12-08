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
- belongs_to :Climb
- belongs_to :user


-----------------------------------------------------------------------


To Dos:

(see notes and project specs for all of it! :) )

**RECORD your coding session at some point!**

--Schedule project review as soon as you can--

X 1. Add additional models (adventure, land) - as g resources (?)
  X 1a. include validations 
X 2. Build relationships between models
  2a. Include a user submittable attribute on the through (the "Adventure") (see notes)
3. Add/update controllers for models (CRUD actions)
  3a. Sign up, Log in, Log out
4. Add/update views (include partials)
  4a. Decide if you are using Admin or not and update as needed 
5. Build scope method that is chainable and has url to see working feature (see notes)
6. Build a nested resource (see notes)
7. Third party authentiction through Devise/Omniauth - Github (or Google)
8. Error messages (see notes)
9. Template design and updates
10. DRY code
  10a. Helper methods 

11. Update README, MIT license, etc. (see additional lessons and docs as needed)
12. Review everything in project against spec.md file and check off/add your notes
13. Project video walkthrough 
14. Review Learn project breakdown and see if there is anything else 
15. Delete any unnecessary files and save notes file info elsewhere
16. Blog
17. Submit project :) 


Ex. rails g resource Book title:string