class Physician < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    belongs_to :category
end
