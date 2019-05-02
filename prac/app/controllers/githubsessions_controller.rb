class GithubsessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
 