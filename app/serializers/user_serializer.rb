class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :is_admin, :email, :image
end