class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
    sign_in_and_redirect user, :event => :authentication
  end
end
