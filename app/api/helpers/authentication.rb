module Authentication

  def current_user
    @user
  end

  def skip_authentication?
    req = Rack::Request.new(env)
    req.post? && req.path =~ /api\/v1\/users\/(.*)/
  end

  def authenticated
    @user = User.find_by authentication_token: headers['Authorization']
  end
end
