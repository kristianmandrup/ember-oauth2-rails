module EmberOauth2Rails
  module ViewHelpers
    def oauth_on_redirect
      %q{<script>
        var hash = window.location.hash;
        window.opener.App.oauth.onRedirect(hash);
        window.close();
      </script>}.html_safe
    end

    def authorize_with provider_id
  %Q{App.oauth = Ember.OAuth2.create(providerId: #{provider_id});
App.oauth.authorize();    
}
    end

    def configure_oauth2_for name = :facebook
      meth = "configure_oauth2_#{name}"
      unless respond_to? meth
        raise "No Ember-Oauth2 config helper has been defined for Oauth provider: #{name}"
      end
      send(meth) 
    end

    def configure_oauth2_google client_id, redirect_uri, scope = nil
      scope ||= 'https://www.googleapis.com/auth/userinfo.profile'
      configure_oauth clientId, redirectUri, auth_base_uri: 'https://accounts.google.com/o/oauth2/auth', scope: scope
    end

    def configure_oauth2_facebook clientId, redirectUri, scope = nil
      scope ||= 'public write'
      configure_oauth clientId, redirectUri, auth_base_uri: 'https://www.facebook.com/dialog/oauth', scope: scope
    end

    def configure_oauth2 clientId, redirectUri, options = {}
      %Q{Ember.OAuth2.config = {
  google: {
    clientId: "#{client_id}",
    authBaseUri: '#{options[:auth_base_uri]}',
    redirectUri: '#{redirect_uri}',
    scope: '#{options[:scope]}'
  } 
}  
}
    end     
  end
end