source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Support the HAML view engine
gem 'haml'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'foundation-rails'

gem 'rollbar', '~> 1.3'

# Change tracking for ActiveRecord models
gem "audited-activerecord", "~> 4.0"

# Easily slugged URLs
gem 'friendly_id', '~> 5.0.0'

# Markdown renderer
gem 'redcarpet'

# Auto breadcrumb generation
gem 'breadcrumbs_on_rails'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'pg', groups: [:production]

group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-bundler', '~> 1.1.2', require: false
  gem 'capistrano-rails', '~> 1.1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false

  # Hush the asset pipeline logging
  gem 'quiet_assets'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'
  gem 'dotenv-rails'
end
