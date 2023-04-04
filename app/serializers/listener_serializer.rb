class ListenerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password
end
