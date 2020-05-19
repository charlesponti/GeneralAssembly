source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '5.2.4.3'

#--- Database
gem 'pg'

#--- Server
#gem "puma"

#--- HTML, CSS, & JS

  gem 'haml-rails', '>= 0.5.3'
  gem 'sass-rails', '~> 5.0.5'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.2.2'
  gem 'jquery-rails', '>= 4.0.1'
  gem 'compass-rails', github: "milgner/compass-rails", branch: "rails4"
  gem 'zurb-foundation'

gem 'turbolinks', '>= 1.3.0'

gem 'jbuilder', '~> 1.4', '>= 1.4.2'

gem 'nested_form'

#--- Authorization
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'cancan'

#--- File Management
gem "fog", "~> 1.3.1"
gem 'carrierwave', '>= 0.9.0'
gem 'rmagick'

#--- Search Data
gem "ransack", github: "ernie/ransack", branch: "rails-4"

gem 'rails_12factor', group: :production

group :test do
  gem 'rspec-rails', '>= 2.14.0'
  gem 'database_cleaner'
  gem 'shoulda', '>= 3.5.0'
  gem 'capybara' 
end

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-stack_explorer'
end