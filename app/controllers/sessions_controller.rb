class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
	user = User.authenticate(params[:session][:email], params[:session][:password])
	session[:user_id] = user.id
	if not user.admin.nil?
		session[:admin] = user.admin
	end
	if user.nil?
		flash.now[:error] = "Invalid email/password combination."
		@title = "Sign in"
		render 'new'
	else
		sign_in user
		redirect_back_or root_path
	end
  end

  def destroy
    sign_out
	session[:user_id] = nil
	session[:admin] = nil
	reset_session
    redirect_to root_path
  end

end
