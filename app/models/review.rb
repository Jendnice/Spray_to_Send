class Review < ApplicationRecord

    belongs_to :climb
    belongs_to :user

    validates :stars, presence: true
    validates :title, presence: true
    validates :content, presence: true
    
end
