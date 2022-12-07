class Category < ApplicationRecord
    validates :name, :details, presence: true
    has_many :tasks
    belongs_to :user
end
