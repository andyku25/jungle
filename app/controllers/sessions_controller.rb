class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(login_params[:email], login_params[:password])
      session[:user_id] = user.id
      redirect_to :root, notice: "User Successifully Logged in"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end

  private
  def login_params
    # puts params
    params.permit(
      :email,
      :password
    )
  end
end
