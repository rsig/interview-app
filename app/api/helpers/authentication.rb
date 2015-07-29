module Authentication

  def current_user
    @user
  end

  def skip_authentication?
    req = Rack::Request.new(env)
    req.post? && req.path =~ /api\/v1\/users\/(.*)/
  end

  def authenticated
    if creds = headers['Authorization'].try(:split, ',')
      @user = User.authenticate_token!(creds.first, creds.last)
    else
      error!('Unauthorized. Invalid Token Credentials', 401)
    end
  end
end
