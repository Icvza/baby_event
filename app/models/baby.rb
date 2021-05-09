class Baby < ApplicationRecord
    has_many :events
    has_many :users, through: :events

    validates :name, presence: true
    validates :DOB, presence: true
end
