class User < ApplicationRecord
    has_many :reading_lists
    has_many :reviews

    def books
        reading_lists.map(&:books).flatten      
    end
end