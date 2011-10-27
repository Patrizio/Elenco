source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'sqlite3'
gem 'haml'
gem 'jquery-rails'
gem 'paperclip', '~> 2.4'
gem 'rack' , '1.3.3'
gem 'rack-google_analytics'

gem 'acts-as-taggable-on', '~>2.1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
#  gem 'sass-rails', "  ~> 3.1.0"
#  gem 'coffee-rails', "~> 3.1.0"
   gem 'uglifier'
end

# Deploy with Capistrano
gem 'capistrano'

group :development, :test do
	gem 'annotate'
	gem 'rspec-rails'
	gem 'fabrication'
	gem 'faker'
	gem 'database_cleaner'
	gem 'capybara'
	gem 'selenium-webdriver'
end

group :production do
  gem 'execjs'
  gem 'therubyracer'
  gem 'mysql2', '~> 0.3.7'
end
