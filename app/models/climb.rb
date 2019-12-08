class Climb < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews
  
    belongs_to :location
  
    accepts_nested_attributes_for :location
  
    validates :name, presence: true
    validates :grade, presence: true

end
