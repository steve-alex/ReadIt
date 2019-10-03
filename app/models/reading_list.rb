class ReadingList < ApplicationRecord
    validates :name, presence: true

    belongs_to :user
    has_many :reading_list_books
    has_many :books, through: :reading_list_books

end