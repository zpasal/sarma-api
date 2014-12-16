class Api::SessionsController < ActionController::Base
  def create
    # Find user by Email
    user = User.find_by(email: params[:email])

    # If user exists and if password is ok
    if (user && user.valid_password?(params[:password]))
      # Update api_token if no present
      user.update_attributes(api_token: SecureRandom.hex) if !user.api_token
    end

    render json: { api_token: user ? user.api_token : nil }
  end

  def destroy
    # TODO
  end
end