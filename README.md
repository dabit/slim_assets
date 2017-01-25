# Use slim to write your Javascript templates

*ALPHA*

[![Build Status](https://secure.travis-ci.org/dabit/slim_assets.png)](http://travis-ci.org/dabit/slim_assets)

Writing Javascript templates for Backbone.js (or other frameworks) in your app? Would you like to use slim and the asset pipeline?

This gem adds slim templating support to the Rails 3.1 asset pipeline. This gem works with the EJS gem and JST asset engine to make your slim available as a compiled Javascript template.

## Installing

Add this to your `Gemfile`

    gem 'slim_assets'
    gem 'ejs'
    gem 'slim'

# Using slim for your Javascript templates

## Templates directory

You should locate your templates under `app/assets`; we suggest `app/assets/templates`. In your Javascript manifest file (for example `application.js`), use `require_tree`

    //= require_tree ../templates

## The template file

Inside your templates directory, add your template file. The file should be named as follows

    your_template_name.jst.ejs.slim

The asset pipeline will then generate the actual Javascript asset

1. Convert your slim to HTML
1. Compile the HTML to an EJS Javascript template
1. Add the template to the JST global under the templates name

**Important!** The asset pipeline is not invoking a controller to generate the templates. If you are using existing view templates, you may have to edit templates to remove some references to controller helpers.

## EJS

In your template file you can use the EJS delimiters as you would normally. If you want to use them in attributes mark the attribute html_safe.

    = f.text_field :email, class: 'text', value: '<%= email %>'.html_safe

### Helpers

All the ActionView and route helpers are available in your template. If you use `form_for` and the related helpers, you should use the *new* object form, even if you are writing an *edit* form, for example

    = form_for :contact, url: "javascript_not_working", html: {:class => :edit_contact, :method => :put} do |f|
      %p
        = f.label :name, "Name"
        = f.text_field :name, class: 'text required', autofocus: true, value: '<%= name %>'.html_safe

# Credits

* Les Hill : @leshill
* Wes Gibbs : @wgibbs

This gem is heavily based on their [haml_assets gem](https://github.com/infbio/haml_assets)

