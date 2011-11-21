# Angular-Rails - The HTML6 Shim [![Build Status](https://secure.travis-ci.org/ludicast/angular-rails.png)](http://travis-ci.org/ludicast/angular-rails)

This project lets you use angularjs with the yummy Rails 3.1 asset pipeline.  The eventual goal is to have it integrate scaffolding with test support.

## Warning!! Code-Theft :)

This README (and some of the accompanying code) is being copied/pasted/ripped from the [http://github.com/codebrew/backbone-rails](backbone-rails) project to help bootstrap things.  Later on I'll cut the cord.

## Requirements

* Rails 3.1 - For the asset pipeline
* Coffeescript - Because more LOC means more bugs
* Ruby 1.9.2 - Because I like the syntax enhancements (but if there's an outcry I can maybe support 1.8.7)

### Installation

Add to your gemfile:

    gem "rails-angular"
  
An bundle away.  To bootstrap things then type:

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

## Angular-Helpers

In an attempt to DRY up angular apps I added an angular-helpers coffeescript file to the assets path.  So far all it has is a Router class that sets up some defaults.  If you subclass it in Coffeescript like so:

    class @PhotoGalleryCtrl extends Router
      routes:->
        {
          default: '/photographers'
          '/photographers':
            template: '<%= asset_path("photographers.html") %>'
            controller: PhotographersCtrl
          '/photographers/:photographer_id/galleries':
            template: '<%= asset_path("galleries.html") %>'
            controller: GalleriesCtrl
          '/photographers/:photographer_id/galleries/:gallery_id/photos':
            template: '<%= asset_path("photos.html") %>'
            controller: PhotosCtrl
        }

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'angular-rails'

Install the gem and generate scaffolding.

    bundle install
    rails g angular:install
  
You now have installed the angular-rails gem, setup a default directory structure for your frontend angular code.
