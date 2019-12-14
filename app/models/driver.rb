class Driver < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    has_one :image, as: :imageable, dependent: :delete
    has_many :car_drivers, dependent: :destroy
    has_many :cars, through: :car_drivers
end
