class User < ApplicationRecord
    # для использования гема bcrypt шифрования пароля
    has_secure_password
end