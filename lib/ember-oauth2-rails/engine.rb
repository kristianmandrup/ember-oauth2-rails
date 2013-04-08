module EmberOauth2Rails
  class Engine < ::Rails::Engine
    initializer 'ember-oauth2' do
      require "ember-oauth2-rails/view_helpers"

      ActionView::Base.send :include, EmberOauth2Rails::ViewHelpers
    end
  end
end
