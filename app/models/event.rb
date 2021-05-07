class Event < ApplicationRecord
    belongs_to :baby 
    belongs_to :user
    
    validates :content, presence: true
    validates :baby_id, presence: true
end
