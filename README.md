# Welcome to Squawk - A realtime messaging application

Squawk is a simple realtime messaging application built with Rails 5 ActionCable.


### Running the app locally
Install gems: `bundle install`

Initialize development database: `export RAILS_ENV=development; bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed; unset RAILS_ENV`

Initialize test database: `export RAILS_ENV=test; bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed; unset RAILS_ENV`

Start rails server: `rails s`

### A Few Notes on Testing Action Cable
I marked one feature test as pending because I had a capybara driver configuration issue. That test uses capybara's window api to test sending and receiving messages in different windows.

According to the conversation thread in this [pull request](https://github.com/rails/rails/pull/23211), DHH and the Basecamp team recommend testing action cable via feature/system tests, using something like the capybara window approach that I attempted. The pull request itself is more related to unit testing channels, and has been packaged into the [action-cable-testing gem](https://github.com/palkan/action-cable-testing). If I were to spend more time on this app I would explore this gem.

### Development TODOs
* Fix capybara driver configuration issue so that I can run feature specs in headless browser

* Add CRUD functionality for chatrooms, currently the app is seeded with a set of chatrooms

* Build more robust user auth system using Devise

* Integrate Warden in tests
 

