class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to chatrooms_path
    else
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :username,
                                 :password_confirmation,
                                 :first_name,
                                 :last_name)
  end
end
