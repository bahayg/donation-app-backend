class CharitySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :image, :address, :city, :description
end
