class Car < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_one :image, as: :imageable, dependent: :delete
    has_many :car_drivers, dependent: :destroy
    has_many :drivers, through: :car_drivers
    enum color: [:blue, :yellow, :red]
end
