# Use slim to write your Javascript templates

Use this to write Backbone.js or AngularJS templates in Slim and let the Rails asset pipeline take over.

[![Build Status](https://secure.travis-ci.org/dabit/slim_assets.png)](http://travis-ci.org/dabit/slim_assets)

## Installing

Add this to your `Gemfile`

    gem 'slim_assets'
    gem 'slim'

# Rails 3

If you use Rails 3, you have to use an older version

    gem 'slim_assets', '~> 0.3.0'

# Rails 5

Not yet, working on it

# Using slim for your Javascript templates

## Templates directory

You should locate your templates under `app/assets`; we suggest `app/assets/templates`.
In your Javascript manifest file (for example `application.js`), use `require_tree`

    //= require_tree ../templates

## The template file

Inside your templates directory, add your template file. The file should be named as follows

    your_template_name.html.slim

The asset pipeline will then generate the actual Javascript asset

**Important!** The asset pipeline is not invoking a controller to generate the templates.
If you are using existing view templates, you may have to edit templates to remove
some references to controller helpers.

### Helpers

All the ActionView and route helpers are available in your template. Eg:

ul
  li = link_to "Home", home_path

### Angular template variables & directives work. Eg:

div.items data-ng-repeat="item in items" {{ item }}


# Original Credits

* Les Hill : @leshill
* Wes Gibbs : @wgibbs

This gem is heavily based on their [haml_assets gem](https://github.com/infbio/haml_assets)

