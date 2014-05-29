source 'https://rubygems.org'

gem 'rails', "~> 4.1.1"

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',     platforms: :ruby

gem "slim-rails"
gem "virtus", "~> 1.0"
gem "concord"

group :development, :test do
  gem 'rspec-rails',         '>= 3.0.0.rc1'
  gem 'rspec',               '>= 3.0.0.rc1'
  gem 'rspec-core',          '>= 3.0.0.rc1'
  gem 'rspec-mocks',         '>= 3.0.0.rc1'
  gem 'rspec-expectations',  '>= 3.0.0.rc1'
  gem 'rspec-support',       '>= 3.0.0.rc1'

  gem 'pry-rails'
  gem 'pry-nav'

  gem 'factory_girl_rails'
end

group :test do
  gem 'turnip', github: "jnicklas/turnip"
  gem 'capybara', github: "jnicklas/capybara"
  gem 'webmock'
  gem 'launchy'
  gem 'email_spec', github: "bmabey/email-spec"
end
