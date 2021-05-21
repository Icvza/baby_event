class Event < ApplicationRecord
    belongs_to :baby
    belongs_to :user

    validates :content, presence: true
    validates :time, presence: true
    validates :baby_id, presence: true
      
    def self.latest_event
      order('time desc').first
    end

    def self.search(content)
        self.where('content LIKE ?', "%#{content}%")
    end
      
end
