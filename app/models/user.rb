class User < ApplicationRecord
    has_many :appointments
    has_many :physicians, through: :appointments

    has_secure_password

end
