class Review < ApplicationRecord
    validates :title, :content, :rating, presence: true
    validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

    belongs_to :user
    belongs_to :book
end