class Book < ApplicationRecord
    has_many :reading_list_books
    has_many :reading_lists, through: :reading_list_books
    has_many :reviews
end