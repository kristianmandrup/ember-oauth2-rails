# Ember Oauth2 Rails

Packaging https://github.com/amkirwan/ember-oauth2 for Rails Asset pipeline for easy inclusion as a gem ;)

Note: The `ember.oauth2` library is packaged under `vendor/assets/javascripts`

## Install

Gemfile

```ruby
gem 'ember-oauth2-rails'
```

bundle!

In js manifest

```javascript
//= require ember.oauth2
```

Or using coffee ;)

```coffeescript
#= require ember.oauth2
```

## View helpers

* oauth_on_redirect (creates `<script>` block)
* authorize_with provider_id - `App.oauth.authorize()` for provider
* configure_oauth2_for(provider_name)

The `oauth_on_redirect` should be used in your view (or `render text: script` in controller action)

You can use the helpers directly in your Rails asset pipeline, fx using `.erb`

```erb
# oauth_config.js.coffee.erb

<%= configure_oauth2_for :facebook %>

# ...

<%= authorize_with(my_provider_id) %>
```

## Register Oauth callbacks

Add Ember OAuth callback event handlers for the login success and failure.

```coffeescript
Ember.OAuth2.reopen
  onSuccess: ->
    console.log 'hello, onSuccess' 
  onError: ->
    console.log 'hello, onError' 
```

Enjoy ;)

## Copyright

See license file in: https://github.com/amkirwan/ember-oauth2