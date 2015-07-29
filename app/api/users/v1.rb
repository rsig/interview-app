module Users
  class V1 < Grape::API
    format :json
    do_not_route_options!

    resource :users do

      # POST /api/v1/users/sign_in
      desc "Authenticates a user and returns a token and email"
      params do
        requires :email, type: String, desc: "The user email."
        requires :password, type: String, desc: "The user password."
      end
      post :sign_in do
        if session = User.sign_in(params[:email], params[:password])
          return session
        end
        error!('Unauthorized. Invalid username or password.', 401)
      end

      # GET /api/v1/users/me.json
      desc "Returns Current User info"
      get :me do
        current_user
      end

    end
  end
end
