# Simple Drawing App

## A simple server & frontend presenting a user with a 20x20 grid of squares the user can 'draw' on to create a simple design.

### Getting started
1. Install Ruby 2.4.0, bundler gem & MYSQL RDBMS
2. Clone or Download the application
3. Navigate into the root of the application in terminal
4. Execute 'bundle install' to install all the dependencies
5. Set MySQL password in config/database.yml for test database
6. Execute 'bundle exec rake db:setup RAILS_ENV=test' to prepare the test database
7. Execute 'bundle exec rspec' to run specs
8. Execute 'bundle exec rake secret' to generate secret key base. Copy the generated key and export into environment variable SIMPLE_DRAWING_APP_SECRET_KEY_BASE
9. Execute 'bundle exec rake assets:precompile' to compile asset files
10. Export MySQL production database name, username and password into environment variables SIMPLE_DRAWING_APP_DATABASE_NAME, SIMPLE_DRAWING_APP_DATABASE_USERNAME, SIMPLE_DRAWING_APP_DATABASE_PASSWORD respectively 
11. Execute 'bundle exec rake db:setup RAILS_ENV=production' to prepare the production database
12. Execute 'passenger start --environment production' to start production server at port 3000
13. Visit http://0.0.0.0:3000/ in a browser (Compatible with latest versions of firefox & chrome as css grid is used)
