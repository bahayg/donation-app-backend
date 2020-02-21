class User < ApplicationRecord
    has_many :requests
    has_many :charities, through: :requests
end
