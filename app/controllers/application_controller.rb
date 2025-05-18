class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern ЗДЕСЬ БАГ КОТОРЫЙ ЗАПРЕЩАЕТ ПОЛЬЗОВАТЬСЯ СТАРЫМ БРАЗУЕРОМ
  #-------------------------------------------------------------------------------------------------------------

  # чтобы метод current_user можно было использовать в шаблонах
  helper_method :current_user

  # чтобы использовать только в контроллерах
  private

  # проверка на то, что пользователь залогинился
  def current_user
    # найти пользователя по id, при условии, что в сессии есть строчка user_id. (для исправления бага)
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # ||= эта запись означает: "Посмотри, что слева и если там nil, то присвой значение из справа и запиши в левую часть". Для мемоизации и чтобы не дёргать БД.
  end
end
