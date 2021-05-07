class Baby < ApplicationRecord
    belongs_to :user
    has_many :events, through: :users

    validates :name, presence: true
    validates :DOB, presence: true
end
