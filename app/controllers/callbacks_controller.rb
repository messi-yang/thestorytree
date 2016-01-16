class CallbacksController < Devise::OmniauthCallbacksController
  def provider
    @user = User.from_omniauth(request.env["omniauth.auth"])
    begin
      sign_in_and_redirect @user
    rescue
      redirect_to :controller =>'static_pages', :action =>'index'
    end
  end

  alias_method :google_oauth2, :provider
  alias_method :facebook, :provider
end