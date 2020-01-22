# AceBook

![Travis (.org)](https://img.shields.io/travis/ffgi-es/acebook_irrelevant_pests) [![Maintainability](https://api.codeclimate.com/v1/badges/fedeff5e44a0253532dd/maintainability)](https://codeclimate.com/github/ffgi-es/acebook_irrelevant_pests/maintainability)

This is a facebook clone built by the Irrelevant Pests team at Makers Academy. It is built on Ruby on Rails.

## Resources

0. The [website](https://acebook-irrelevant-pests.herokuapp.com) in production.

1. [Github](https://github.com/ffgi-es/acebook_irrelevant_pests)

2. [Trello card wall](https://trello.com/b/r1vhlHeb/acebook-irrelevant-pests)

3. [Learning Documentation - Twitter](https://twitter.com/irrelevantpests)

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## User Stories

```
Complete !!!
  As a customer
  So that users have to sign up first
  I want new visitors to be redirected to the index page
  
Complete !!!
  As a user
  So that I can access Acebook
  I want to be able to sign up
  
Complete !!!
  As a user
  So that I can protect my information
  I want to be able to log out

Complete !!!
  As a user
  So that I can access my profile
  I would like to be able to sign back in.

Complete !!!
  As a user
  So that I can correct mistakes
  I would like to be able to edit my posts
  
Complete !!!
  As a customer
  So that user don’t abuse their editing privileges
  I want to limit the time after which they can edit a post
  
Complete !!!
  As a user
  So that I can remove unwanted posts
  I would like to delete posts

Complete !!!
  As a customer
  So users cannot edit/delete other users posts
  I would like the user to be alerted upon said actions.

```

## Database structures 

| User       | Post         |
|------------|--------------|
| id         | id           |
| first_name | message      |
| last_name  | created_at   |
| email      | update_at    |
| password   | user_id      |
|            | wall_user_id |

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Team

- Alastair Gilles
- Hisham Bokhari
- Jonathan Palma
- Kealan Heena
- Sam Folorunsho
