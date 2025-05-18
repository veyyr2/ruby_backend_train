class User < ApplicationRecord
    # для использования гема bcrypt шифрования пароля. Также он делает валидацию пароля
    has_secure_password

    # колбэк для того, чтобы перевести ник в нижний регистр
    before_save :downcase_nickname

    # валидация
    validates :email, :nickname, presence: true, uniqueness: true

    # изменить регистр никнейма
    def downcase_nickname
        nickname.downcase!
    end
end