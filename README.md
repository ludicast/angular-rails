# Warning -

This is still being built.  Don't use yet :)

# Warning Code-Theft

This README (and some of the accompanying code) is being copied/ripped from the backbone-rails project to help bootstrap things.  Later on I'll cut the cord.

# Angular-Rails [![Build Status](https://secure.travis-ci.org/codebrew/angular-rails.png)](http://travis-ci.org/codebrew/angular-rails)

Easily setup and use angularjs (0.9.19) with rails 3.1

## Rails 3.1 setup
This gem requires the use of rails 3.1, coffeescript and the new rails asset pipeline provided by sprockets.

This gem vendors the latest stable version of angular.js for Rails 3.1 and greater. This file will be added to the asset pipeline and available for you to use. 
    
### Installation

In your Gemfile, add this line:

    gem "rails-angular"
  
Then run the following commands:

    bundle install
    rails g angular:install

### Layout and namespacing

Running `rails g angular:install` will create the following directory structure under `app/assets/javascripts/angular`:
  
    controllers/
    filters/
    services/
		views/
    widgets/
    
    
## Generators
angular-rails provides a simple generator to help get you started using angular.js with rails 3.1. 
The generators will only create client side code (javascript).

### Controller Generator

    rails g angular:controller ModelName
    
This generator creates an angular controller inside `app/assets/javascript/angular/controllers` to be used to talk to the rails backend.

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'rails-angular'

Install the gem and generate scaffolding.

    bundle install
    rails g angular:install
    rails g scaffold Post title:string content:string
    rake db:migrate
    rails g angular:controller Post
    
You now have installed the angular-rails gem, setup a default directory structure for your frontend angular code. 
Then you generated the usual rails server side crud scaffolding and finally generated angular.js code to provide a simple single page crud app.
You have one last step:

Now start your server `rails s` and browse to [localhost:3000/posts](http://localhost:3000/posts)
You should now have a fully functioning single page crud app for Post models.

