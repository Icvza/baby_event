class Baby < ApplicationRecord
    belongs_to :user
    has_many :events

    validates :name, presence: true
    validates :DOB, presence: true
end
