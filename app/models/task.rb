class Task < ApplicationRecord
    validates :name, :details, :deadline, presence: true
    belongs_to :category
end
