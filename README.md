# Project Goals

Easily setup and use angularjs (0.9.19) with rails 3.1

## Warning!! Code-Theft :)

This README (and some of the accompanying code) is being copied/pasted/ripped from the [http://github.com/codebrew/backbone-rails](backbone-rails) project to help bootstrap things.  Later on I'll cut the cord.

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
    widgets/

It will also add to the application.js file the appropriate requires.

## Generators

angular-rails provides a simple generator to help get you started using angular.js with rails 3.1.  The generators will only create client side code (javascript).

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'angular-rails'

Install the gem and generate scaffolding.

    bundle install
    rails g angular:install
  
You now have installed the angular-rails gem, setup a default directory structure for your frontend angular code.
