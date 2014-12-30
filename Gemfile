source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# Assets
gem 'rails-assets-bootstrap'
gem 'rails-assets-Buttons'
gem 'rails-assets-Font-Awesome'

# Not from Rails Assets
gem 'octicons-rails'
gem 'react-rails', '~> 1.0.0.pre', github: 'reactjs/react-rails'

# Database
gem 'mongoid', '~> 4.0.0'
gem 'mongoid-observers'

# Websocket
gem 'websocket-rails'

# General configuration
gem 'foreman'
gem 'figaro'

# Text extraction
gem 'twitter-text'

# OAuth
gem 'octokit'
gem 'omniauth', '~> 1.1.4'
gem 'omniauth-github'

# Cache
gem 'faraday-http-cache'

# Server
gem 'thin'

# Analytics
gem 'google-analytics-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'byebug'
  gem 'simplecov', :require => false
  gem 'shoulda-matchers', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'priscilla'
  gem "rubycritic", :require => false
end

group :production do
  gem 'rails_12factor'
end