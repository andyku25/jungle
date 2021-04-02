class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: login_params[:email])

    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to :root, notice: "User Successifully Logged in"
    else
      redirect_to :new
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
