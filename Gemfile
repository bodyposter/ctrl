source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password(https://mmenujs.com/tutorials/off-canvas/
gem 'bcrypt', '~> 3.1.7'
gem 'paperclip', '~> 6.0.0'
gem 'jquery-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
gem 'prawn'
gem 'prawn-table'
gem 'prawn_rails'
gem 'caracal-rails'
gem 'libreconv'
gem 'responders', '~> 2.3'
gem "rename"
gem 'uglifier'
gem 'bootstrap3-rails'
gem 'popper_js', '~> 1.14.5'
gem 'devise', '~> 4.5'
gem 'gravatar_image_tag', github: 'mdeering/gravatar_image_tag'
gem 'mini_magick'
gem 'activestorage'
gem 'pickadate-rails'

#gem 'jquery-turbolinks'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
 # automatic `git push` before deployment (handy feature)
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
 # gem 'sqlite3', '~> 1.3.6'
  #gem 'capistrano',  '~> 3.4.0'
  #gem 'capistrano-passenger'
  #gem 'capistrano-rvm' # rvm support
  #gem 'capistrano-bundler' # bundle command
  #gem 'capistrano-rails' # assets and migrations
  #gem 'capistrano-faster-assets' # skips assets precompilation if not needed
  #gem 'capistrano3-git-push'

end

#group :development do
#  gem 'capistrano',  '~> 3.4.0'
#  gem 'capistrano-passenger'
#  gem 'capistrano-rvm' # rvm support
#  gem 'capistrano-bundler' # bundle command
#  gem 'capistrano-rails' # assets and migrations
#  gem 'capistrano-faster-assets' # skips assets precompilation if not needed
#  gem 'capistrano3-git-push'

#end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
