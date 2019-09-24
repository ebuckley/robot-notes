class DashboardController < ApplicationController
  include Secured
  def show
    Rails.logger.info(session[:userinfo].inspect)
  end
end
