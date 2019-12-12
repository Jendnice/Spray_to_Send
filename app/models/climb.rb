class Climb < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews
  
    belongs_to :location
  
    accepts_nested_attributes_for :location
  
    validates :name, presence: true
    validates :grade, presence: true

    scope :grouped_ratings, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

    scope :search, -> (query) { where("name LIKE ?", "%" + query + "%") }

#write the scope method
#custom route
#controller method
#view 



    def self.alphabetical_order
        order(:name)
    end 
    

    def location_attributes=(location_attributes)
        location_name = location_attributes["name"]
        unless location_name.blank?
             location = Location.find_or_create_by(name: location_name)
             self.location = location
        end
    end


end
