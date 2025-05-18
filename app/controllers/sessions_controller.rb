class SessionsController < ApplicationController
  def new
  end

  # создать сессию
  def create
    # из формы new.html.erb запрашиваем session
    user_params = params.require(:session)

    # находим юзера по почте. Через знак & присваиваем зависимость: "Если нашел юзера по почте, то можно аутентифицировать его по паролю. Если не нашел, то вывода ошибки rails не будет. "
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    # проверка на nil, то есть на существование пользователя по email (индентификация)
    if user.present?
      # если находим такого юзера, то записываем в куки его id
      session[:user_id] = user.id

      # отправить юзера на корневой путь
      redirect_to root_path, notice: 'Вы вошли на сайт!'
    else
      # вывести предупреждение, если неправильный email или пароль. Flash.now для того, чтобы его не выводит в других html страницах
      flash.now[:alert] = 'Неправильный email или пароль'

      # отрендерить ту страницу с входом в систему
      render :new
    end
  end

  # удалить сессию из куки
  def destroy
    # удалить поле user_id
    session.delete(:user_id)

    redirect_to root_path, notice: 'Вы вышли из аккаунта!'
  end
end