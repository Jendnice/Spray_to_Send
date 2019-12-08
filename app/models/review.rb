class Review < ApplicationRecord

    belongs_to :climb
    belongs_to :user
    
end
