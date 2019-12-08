class Location < ApplicationRecord

    has_many :climbs
    
    validates :name, presence: true

end
