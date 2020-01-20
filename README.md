# AceBook

## User Stories

```
In Progress ...
  As a customer
  So that users have to sign up first
  I want new visitors to be redirected to the index page
  
Complete !!!
  As a user
  So that I can access Acebook
  I want to be able to sign up
  
Todo ...
  As a user
  So that I can protect my information
  I want to be able to log out

Todo ...
  As a user
  So that I can access my profile
  I would like to be able to sign back in.

Complete !!!
  As a user
  So that I can correct mistakes
  I would like to be able to edit my posts
  
Todo ...
  As a customer
  So that user don’t abuse their editing privileges
  I want to limit the time after which they can edit a post
  
In Progress ...
  As a user
  So that I can remove unwanted posts
  I would like to delete posts

Todo ...
  As a customer
  So users cannot edit/delete other users posts
  I would like the user to be alerted upon said actions.

```

## Database structures 

| User       | Post       |
|------------|------------|
| id         |    id      |
| first_name | message    |
| last_name  | created_at |
| email      | update_at  |
| password   | user_id    |

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
