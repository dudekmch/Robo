# README

Application was creating to learn and practice Ruby and Ruby on Rails. The app is a shop, where you can buy robots. All data about robots(products) was genereted with Faker gem.

# Run application locally

1. Clone repo
2. Create database, and run migration : 'rake db:create db:migrate'
3. Run seeds to add some examples of products, categories,two users (one with     admin permissions, second without this permissions), two types of shippings,   with command: 'rake db:seed'. Login and password to created by seeds users     find in seeds.rb file.

# Application on heroku

1. Pictures of robots dose not show - is some problem with public folder
2. Because of using letter_opener gem, without SMTP, after action invoke mail     sending, application is crashing - do not create    new user, use only         users created with seeds.rb

# TODO

1. Project does not contains any tests
2. Add external SMTP 
3. Editing account setting for log in user (dropdown on main navbar, after log    in)
4. Add searchers and filters on fields for all panels (admin panels and user      panels)
5. Fill static page with text