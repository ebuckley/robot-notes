class Auth0Controller < ApplicationController
    include LogoutHelper
    def callback
        # This stores all the user information that came from Auth0
        # and the IdP
        session[:userinfo] = request.env['omniauth.auth']
    
        # Redirect to the URL you want after successful auth
        redirect_to '/dashboard'
      end
    
      def failure
        # show a failure page or redirect to an error page
        @error_msg = request.params['message']
      end

      def logout
        reset_session
        redirect_to logout_url
      end
end
