# Angular-Rails - The HTML6 Shim [![Build Status](https://secure.travis-ci.org/ludicast/angular-rails.png)](http://travis-ci.org/ludicast/angular-rails)

This project lets you use angularjs with the yummy Rails 3.1 asset pipeline.  The eventual goal is to have it integrate scaffolding with test support.

## Warning!! Code-Theft :)

This README (and some of the accompanying code) is being copied/pasted/ripped from the [backbone-rails](http://github.com/codebrew/backbone-rails) project to help bootstrap things.  Later on I'll cut the cord.

## Assumptions

* Rails 3.1 - For the asset pipeline
* Coffeescript - Because less LOC means less bugs, plus it is the Rails Way, like it or not.
* Ruby 1.9.2 - Because I like the syntax enhancements (but if there's an outcry I can support 1.8.7)
* RSpec - This is a loose requirement, but all specs generated will be, well rspec.  Once we have end-to-end coverage, someone can add a patch for testunit (or mini*) support.
* RESTful controllers - another loose requirement, but it will help things be smoother for you.  The goal is as little friction as possible between the front and back ends, without resorting to Node.js :).

### Installation

Add to your gemfile:

    gem "rails-angular"
  
And bundle away.  To bootstrap things then type:

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

So far we have a controller generator which generates a controller file if you rum

    rails g angular:controller MODELNAME

This file is empty except for the class declaration, but I will be adding some RESTful controller functionality shortly.

## Angular-Helpers

In an attempt to DRY up angular apps I added an angular-helpers coffeescript file to the assets path.  So far it has a Router superclass for your main application router.  If you subclass it in Coffeescript like so:

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

You will have those routes set up.  All this class needs is a member function called `routes` that returns a hash of routing information.

Note that this class will need to be injected with both the $xhr and the $route object like so:

    PhotoGalleryCtrl.$inject = ['$route', '$xhr']

This is because it sets us sowe CSRF preventions using $xhr as well.  All this is pretty much ripped from a demo by [Daniel Nelson](https://github.com/centresource/angularjs_rails_demo).

Another thing added is a `resourceService` function.  This function is called like:

	resourceService 'Photos', 'photographers/:photographer_id/galleries/:gallery_id/photos', 'index'
	resourceService 'SelectedPhotos', 'selected_photos/:selected_photo_id'
     
This sets up angular services for at the listed paths.  Also add to the end all the actions that you want it to support.  So far the accepted actions are 'index', 'update', 'create' and 'destroy'.  If you leave off all actions, it will automatically assume that you want to support all 4.

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'angular-rails'

Install the gem and generate scaffolding.

    bundle install
    rails g angular:install
  
You now have installed the angular-rails gem, setup a default directory structure for your frontend angular code.
