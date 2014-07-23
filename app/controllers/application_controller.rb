class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  def current_user
    super || Guest.new
  end

  protect_from_forgery with: :exception
end
