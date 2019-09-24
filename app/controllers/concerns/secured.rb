module Secured
    extend ActiveSupport::Concern
    included do
        before_action :logged_in_using_omniauth?
    end

    def logged_in_using_omniauth?
        unless session[:userinfo].present?
            flash[:error] = "You must be logged in to use this"
            redirect_to '/'
        end
    end
end