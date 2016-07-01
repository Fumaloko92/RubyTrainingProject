# frozen_string_literal: true

source "http://rubygems.org"

# Postgres for Active Record
gem "pg", "~> 0.19.0.pre20160409114042"
gem "silent-postgres"

gem 'ffi'
gem 'bcrypt'
gem "rails", ">= 5.0.0.rc1", "< 5.1"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "turbolinks", "~> 5.x"
gem "tzinfo-data"
gem "slim-rails", "~> 3.0.1"
gem 'warden'
gem "devise"
gem "pundit"
gem "omniauth-facebook"

gem 'capybara'
gem "cloudinary"
gem "rest-client", "~> 1.8.0"
gem "attachinary"
gem "jquery-fileupload-rails"
gem "coffee-rails"
gem "friendly_id", "~> 5.1.0"

# custom simple form for fixing this issue:
# https://github.com/plataformatec/simple_form/issues/1341
gem "simple_form",
  :github => "kesha-antonov/simple_form",
  :branch => "rails-5-0"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and
  # get a debugger console
  gem "byebug", :platform => :mri

  # necessary for guard-rspec
  gem "rspec", "= 3.5.0.beta4"
  gem "rspec-core", "= 3.5.0.beta4"
  gem "rspec-expectations", "= 3.5.0.beta4"
  gem "rspec-mocks", "= 3.5.0.beta4"
  gem "rspec-support", "= 3.5.0.beta4"

  gem "rspec-rails", "= 3.5.0.beta4"

  gem "rspec-its"
  gem 'shoulda-matchers', require: false
  gem "rspec-collection_matchers"
  gem "rails-controller-testing"
  gem "factory_girl_rails", "~> 4.7.0"
  gem "faker", "~> 1.6.3"
  gem "database_cleaner"
end

group :development do
  gem "better_errors"
  gem "quiet_assets"

  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "guard-rspec", "~> 4.7"
  gem "guard-rubocop"
  gem "spring-commands-rspec"
end

source "http://insecure.rails-assets.org" do
  gem "rails-assets-basscss-sass"
end

gem 'rails_12factor', group: :production