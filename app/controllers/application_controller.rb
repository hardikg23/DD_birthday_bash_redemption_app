class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  http_basic_authenticate_with name: "paritycube", password: "desidime123", only: :index

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      token == 'afe9858af42a4be14dbc14c3931d8f5c'
    end
  end
end
