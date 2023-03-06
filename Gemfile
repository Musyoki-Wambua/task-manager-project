source "https://rubygems.org"

gem 'sinatra', '~> 3.0', '>= 3.0.5'

# An object-relational mapper
gem 'activerecord', '~> 7.0', '>= 7.0.4.2'

# Configures common Rake tasks for working with Active Record
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.26'

# Rack middleware. Used specifically for parsing the request body into params.
gem "rack-contrib", "~> 2.3"

# Run common tasks from the command line
gem 'rake', '~> 13.0', '>= 13.0.6'

# Provides functionality to interact with a SQLite3 database
gem "sqlite3", "~> 1.4"

# Provides a simple and easy-to-use solution for handling CORS in Sinatra web apps
gem 'sinatra-cross_origin', '~> 0.4.0'

# Provides a fast and concurrent web server for Ruby applications.
gem 'puma', '~> 6.1'

#Provide a simple and secure way to hash passwords
gem 'bcrypt', '~> 3.1', '>= 3.1.18'

# Require all files in a folder
gem 'require_all', '~> 3.0'

gem 'rack-cors'


# These gems will only be used when we are running the application locally
group :development do
  # Used to generate seed data
  gem 'faker', '~> 3.1', '>= 3.1.1'

  # Auto-reload the server when files are changed
  gem 'rerun', '~> 0.14.0'

  gem "pry"
end

group :test do
    gem 'rack-test', '~> 2.0', '>= 2.0.2'
    gem 'rspec', '~> 3.12'
end
