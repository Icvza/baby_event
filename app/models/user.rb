class User < ApplicationRecord
    has_many :babies
    has_many :events, through: :babies 
    
    has_secure_password

    validates :email, presence: true, :uniqueness => { :case_sensitive => false }
    validates :password, length: { minimum: 6 }, if: :password_digest_changed?
    validates :name, presence: true
    validates :username, presence: true
end