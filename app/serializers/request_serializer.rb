class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user, :charity, :expiration_date, :info, :status, :category
end
