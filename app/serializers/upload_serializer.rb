class UploadSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :audio_url
end
