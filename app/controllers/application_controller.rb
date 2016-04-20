class ApplicationController < ActionController::Base
  before_action :redirect_visitors
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper
end
