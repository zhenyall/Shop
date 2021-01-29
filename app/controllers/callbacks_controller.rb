class CallbacksController < Devise::OmniauthCallbacksController
  include ActionController::RequestForgeryProtection
  skip_before_action :verify_authenticity_token, only: :github
  # protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }


  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end