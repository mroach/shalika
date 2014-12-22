module AuthHelper
  def http_login(user, pass)
    cred = ActionController::HttpAuthentication::Basic.encode_credentials(user, pass)
    request.env['HTTP_AUTHORIZATION'] = cred
  end
end
