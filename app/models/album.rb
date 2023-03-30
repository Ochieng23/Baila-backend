class Album < ApplicationRecord
    belongs_to :category
    has_many :songs, dependent: :destroy
    
end
