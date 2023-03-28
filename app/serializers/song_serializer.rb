class SongSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :length, :image, :image_url, :audio_url
end
