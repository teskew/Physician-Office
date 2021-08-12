class User < ApplicationRecord
    has_many :physicians
    has_secure_password

end
