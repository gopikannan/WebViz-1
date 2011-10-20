class SessionsController < ApplicationController
  def new
          auth = request.env["omniauth.auth"]
          user = User.find_by_fb_id(auth["uid"]) || User.create_with_omniauth(auth)
          session[:user_id] = user.id
	  session[:location]='raleigh'
	  session[:latest_click]=-1;
          redirect_to root_path

  end

end
