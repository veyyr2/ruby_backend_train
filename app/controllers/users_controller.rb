class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now # занести в куки поле с временем сейчас (необязательно)
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email)

    User.create(user_params) 

    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end
end
