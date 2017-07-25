# Bloccit

> Just like Reddit, Bloccit is an app where people can post, vote on, share and save links and comments. Bloccit is a fully responsive, fully functional, rapidly developed MVP constructed to focus on back-end engineering.

### Feature Set:

* As a public user, I am able to only view the content on Bloccit.
* As a member, I want to securely sign up for a free account by providing a name, email, and password. I also want to sign in and out of Bloccit.
* As a member, I want to create a post. Posts must be associated with a user and a topic.
* As a member authoring a post, I want to add labels (tags) to my post. Labels must be associated with posts.
* As a member, I want to add a comment within a post. Comments should display instantly without loading. Comments must be associated with a user and a post.
* As a member, I should be able to edit or delete posts and comments I've authored.
* As a member, I want to be able to favorite posts, and view a list of my favorites. Favorites must belong to a user.
* As a member, I want to be able to vote up/vote down posts.
* All posts within a topic should be ordered by a ranking algorithm. Every post must have an associated ranking value (hidden). <!-- post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds -->
* As an admin, I want to be able to edit or delete comments, posts or entire Bloccit topics.
* As an admin, I want to be able to create site topics, the equivalent of sub-reddits.
* All registered users must have a role (member or admin.)

### Technology & Praxis:

* Ruby on Rails
* Test-Driven Development (RSpec)
* MVC Architecture
* RESTful API design
* Secure User Authentication
* Scoped actions & content for public, private, and Admin users
* SQL database configuration & management
* Create, Read, Update, Delete functions
* Object-Oriented Programming
* Nested resources & associations
 
<br>

> ### Credits:
> Bloccit is hand-crafted by Drian Hillman during the Software Engineering Track at [BLOC](https://bloc.io).