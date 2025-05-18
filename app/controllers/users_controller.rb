class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now # занести в куки поле с временем сейчас (необязательно)
    @user = User.new
  end

  def create
    # создать юзера, но не сохранить
    @user = User.new(user_params) 

    # если пользователя сохраняют
    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации!'

      # отрендерить ту же страницу регистрации
      render :new
    end
  end

  def edit
    # находим юзера
    @user = User.find(params[:id])
  end

  def update
    # находим юзера
    @user = User.find(params[:id])

    # если пользователя сохраняют
    if @user.update(user_params)
      redirect_to root_path, notice: 'Вы успешно изменили данные!'
    else
      flash.now[:alert] = 'Возникли ошибки при изменении данных'

      # отрендерить ту же страницу изменения
      render :edit
    end
  end

  def destroy
    # находим юзера
    @user = User.find(params[:id])

    @user.destroy
    # удалить сессию
    session.delete(:user_id)

    redirect_to root_path, notice: 'Вы успешно удалили аккаунт!'
  end

  #--------------------------------------------------------------------------------------------------------
  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end