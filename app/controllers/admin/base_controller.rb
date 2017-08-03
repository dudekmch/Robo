class Admin::BaseController < ApplicationController
  layout 'content'
  before_action :authenticate

  def authenticate
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
end