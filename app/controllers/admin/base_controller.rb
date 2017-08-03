class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic 'Podaj haslo' do |name, password|
      name == 'admin' && password == 'admin'
    end
  end
end
