class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.body = { 'client_id': 9b3367fa1fe4dd9f4382, 'client_secret': a2b1ef0558d7bc5b7d6e77d662f72262ecbf3e9f, 'code': params["code"] }
     req.headers['Accept'] = 'application/json'
 end

 body = JSON.parse(resp.body)
 session[:token] = body["access_token"]
 redirect_to root_path
  end
end
