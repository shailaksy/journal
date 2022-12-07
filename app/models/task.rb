class Task < ApplicationRecord
    validates :name, :details, presence: true
    belongs_to :category
end
