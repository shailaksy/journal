class Account < ApplicationRecord
    validates :username, :password, presence: true
end
