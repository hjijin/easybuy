class UsersController < ApplicationController
  # before_filter :find_model

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "注册成功，请登录。"
      redirect_to new_sessoion_path
    else
      render action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end