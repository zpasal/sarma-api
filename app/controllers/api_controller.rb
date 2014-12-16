class ApiController < ActionController::Base
  before_filter :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(api_token: token)
    end
  end

  def current_user
    @current_user
  end
end