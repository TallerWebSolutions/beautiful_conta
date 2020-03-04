source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jquery-rails'
gem 'react-rails'
gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons'
gem "font-awesome-rails"

gem 'devise'
gem 'omniauth'
# gem 'omniauth-facebook'

gem 'will_paginate'

gem 'simple_form'
gem 'rack-cors', :require => 'rack/cors'
gem 'knock', git: 'https://github.com/flaviostudartvasconcelos/knock.git'
gem 'faraday', '~> 0.15.4'

gem "select2-rails"

gem 'chartjs-ror'
gem 'jquery_mask_rails', '~> 0.1.0'

gem 'webpacker', '~> 4.x'

gem 'ibm_watson', '~> 1.2.0'

group :production do
  gem "aws-sdk-s3", require: false
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
