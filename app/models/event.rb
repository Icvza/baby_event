class Event < ApplicationRecord
    belongs_to :baby
    belongs_to :user

    validates :content, presence: true
    validates :baby_id, presence: true


    def self.everything
        joins(:users, :babies)
    end


    def store_attributes=(attr_hash)
        if !attr_hash.empty?
            self.baby = Baby.find_or_create_by(attr_hash) 
        end  
    end 
end
