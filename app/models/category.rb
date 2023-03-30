class Category < ApplicationRecord
    has_many :artists, dependent: :destroy
    has_many :albums, dependent: :destroy
    validates :name, presence: true
  end
  