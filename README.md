# Angular-Rails - The HTML6 Shiv [![Build Status](https://secure.travis-ci.org/ludicast/angular-rails.png)](http://travis-ci.org/ludicast/angular-rails)

This project lets you use angularjs with the yummy Rails 3.1 asset pipeline.  The eventual goal is to have it integrate scaffolding with test support.

## Warning!! Abandoned Fork

This library hasn't been updated for a while.  Rails 3 is now Rails 5.  Angularjs 1 is now Angular 7.  Use at your peril :).

## Credit to backbone-rails

The initial fork/inspiration was from the [backbone-rails](http://github.com/codebrew/backbone-rails) project.

## Assumptions

* Rails 3.1 - For the asset pipeline
* Coffeescript - Because less LOC means less bugs, plus it is the Rails Way, like it or not.
* Ruby 1.9.2 - Because I like the syntax enhancements (but if there's an outcry I can support 1.8.7)
* RSpec - This is a loose requirement, but all specs generated will be, well rspec.  Once we have end-to-end coverage, someone can add a patch for testunit (or mini*) support.
* RESTful controllers - another loose requirement, but it will help things be smoother for you.  The goal is as little friction as possible between the front and back ends, without resorting to Node.js :).

### Installation

Add to your gemfile:

    gem "angular-rails"
  
And bundle away.  To bootstrap things then type:

    rails g angular:install

### Layout and namespacing

Running `rails g angular:install` will create the following directory structure under `app/assets/javascripts/angular`:
  
    controllers/
    filters/
    services/
    widgets/

It will also generate a `templates/` directory under app assets, where view templates can be stored.  This lets you use haml, etc. for your angular views.

It will also add to the application.js file the appropriate requires.

## Generators

angular-rails provides a simple generator to help get you started using angular.js with rails 3.1.  The generators will only create client side code (javascript).

So far we have a controller generator which generates a controller file if you rum

    rails g angular:controller MODELNAME

This file is empty except for the class declaration, but I will be adding some RESTful controller functionality shortly.

## angle-up


In an attempt to DRY up angular apps I added the angle-up javascript file to the assets path.  [angle-up](https://github.com/ludicast/angle-up) attempts to add some opinions to angular apps.

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'angular-rails'

Install the gem and generate scaffolding.

    bundle install
    rails g angular:install
  
You now have installed the angular-rails gem, setup a default directory structure for your frontend angular code.
