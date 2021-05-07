class User < ApplicationRecord
    has_many :babies
    has_many :events, through: :babies
    
    has_secure_password

    validates :email, presence: true
end
