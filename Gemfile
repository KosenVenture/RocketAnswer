source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'

### Database
gem 'mysql2', '>= 0.3.18', '< 0.5'

### Rack
gem 'puma', '~> 3.7'

### 設定関連
gem 'config'


### モデル関連
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'carrierwave'
gem 'enumerize'

### ユーザー権限管理
gem 'cancancan', '~> 1.16'


### Assets関連
gem 'therubyracer', platforms: :ruby
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-fileupload-rails'
gem 'selectize-rails'
gem 'font-awesome-rails'


### View関連
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
# パンくずリスト
gem 'gretel'
# Markdown
gem 'redcarpet'


### 管理画面
gem 'activeadmin'


### ロケール関連
gem 'rails-i18n'


### pry
gem 'pry'
gem 'pry-rails'

##xss対策
gem 'validate_url'

gem 'ransack' 

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # N+1 Query検出
  gem 'bullet'

  gem 'hirb'
  gem 'hirb-unicode'
  gem 'awesome_print'
end
