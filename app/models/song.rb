class Song < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
