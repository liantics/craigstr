class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  def current_user
    super || Guest.new
  end
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
end
