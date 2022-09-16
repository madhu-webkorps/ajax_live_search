class Address < ApplicationRecord
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :pin_code, presence: true
    validates :district, presence: true
    
    belongs_to :user
end
