source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"
# pg_ctl.exe restart -D  "C:\Program Files\PostgreSQL\14\data"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "sprockets-rails"
#gem "sqlite3", "~> 1.4"
gem "pg"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "simple_form"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data"
gem "bootsnap", require: false
gem "haml-rails", "~> 2.0"
gem "ffi"
gem "rails-controller-testing"

# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

=begin
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
=end

# Run against this stable release
group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "factory_bot_rails"
  gem 'shoulda-matchers', '~> 5.0'
end
