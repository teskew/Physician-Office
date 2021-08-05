class Physician < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    belongs_to :category
    validates :name, presence: true
    validates :email, presence: true
    # validate :too_many_shoes
end
