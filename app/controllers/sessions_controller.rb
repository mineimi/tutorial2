class SessionsController < ApplicationController
<<<<<<< HEAD

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
=======
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
>>>>>>> advanced-login
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
<<<<<<< HEAD

  def destroy
    log_out
    redirect_to root_url
  end
end
=======
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
>>>>>>> advanced-login
