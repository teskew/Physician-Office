class Physician < ApplicationRecord
    belongs_to :user
    has_many :appointments
    has_many :categories, through: :appointments
    accepts_nested_attributes_for :appointments, reject_if: proc { |attributes| attributes['appointment_datetime'].blank?}
    validates :name, presence: true 
    validates :email, presence: true


    def name_and_email
        "#{self.name} - #{self.email}"
    end

end