class Event < ApplicationRecord
    belongs_to :baby
    belongs_to :user

    validates :content, presence: true
    validates :time, presence: true
    validates :baby_id, presence: true

    def store_attributes=(attr_hash)
        if !attr_hash.empty?
            self.baby = Baby.find_or_create_by(attr_hash) 
        end  
    end 
      
    def self.latest_event
      order('time desc').first
    end

    def self.search(content)
        self.where('content LIKE ?', "%#{content}%")
    end
      
end
