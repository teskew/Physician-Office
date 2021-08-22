class User < ApplicationRecord
    has_many :physicians

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    has_secure_password  # authenticate, password=, validate


    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.email = auth['info']['email']
            u.username = auth['info']['name']
            u.password = SecureRandom.hex(15)
        end
    end
    scope :order_alpha, -> {order(:username)}
# def self.order_alpha
#     self.order(:username)
# end


end
