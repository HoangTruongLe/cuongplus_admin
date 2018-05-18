source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use devise
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'haml-rails', '~> 1.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'simple_form', '~> 3.5'
gem 'cancancan', '~> 2.0'
gem 'ckeditor', '~> 4.2', '>= 4.2.4'
gem 'js-routes', '~> 1.4', '>= 1.4.1'
gem 'i18n-js', '~> 3.0', '>= 3.0.2'
gem 'rails-jquery-autocomplete', '~> 1.0', '>= 1.0.3'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'chewy', '~> 0.10.1'
gem 'friendly_id', '~> 5.1.0'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem 'google-analytics-rails'
gem 'settingslogic', '~> 2.0', '>= 2.0.9'
gem 'ransack', '~> 1.8', '>= 1.8.7'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'country_select', '~> 3.1', '>= 3.1.1'
gem 'validates_email_format_of', '~> 1.6.3'
gem "jsonb_accessor", "~> 1.0.0"
gem 'rails-i18n'

gem 'aws-sdk'
gem 'aws-sdk-s3'
gem 'paperclip'
gem 'autonumeric-rails'
gem 'dropzonejs-rails'
gem "wysiwyg-rails"
gem "jquery-slick-rails"
gem 'toastr-rails'
gem 'best_in_place'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'capistrano', '~> 3.8', '>= 3.8.1'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rvm', github: "capistrano/rvm"

  gem 'annotate', '~> 2.7', '>= 2.7.1'
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.1'
  gem 'awesome_print'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
