class Location < ApplicationRecord

    has_many :climbs
    
    validates :name, presence: true

    def self.alphabetical_order
        order(:name)
    end

end
 