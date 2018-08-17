class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

  def authenticate_user
    client_id = 9b3367fa1fe4dd9f4382
   redirect_uri = CGI.escape("http://localhost:3000/auth")
   foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
   if !logged_in?
     redirect_to 'https://github.com'
   else
   redirect_to github_url unless logged_in?
   end
  end

  def logged_in?
    !!session[:token]

  end
end
