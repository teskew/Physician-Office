class Physician < ApplicationRecord
    belongs_to :user
    has_many :appointments
    has_many :categories, through: :appointments
    accepts_nested_attributes_for :appointments, reject_if: proc { |attributes| attributes['date'].blank?  }
    accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank?  }
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true


    def name_and_email
        "#{self.name} - #{self.email}"
    end

end