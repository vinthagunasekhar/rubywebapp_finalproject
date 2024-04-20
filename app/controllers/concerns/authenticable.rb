module Authenticable
  def current_user
    auth_token = request.headers['Authorization']
    return nil if auth_token.blank?
    @current_user ||= User.find_by(auth_token: auth_token)
  end
end
