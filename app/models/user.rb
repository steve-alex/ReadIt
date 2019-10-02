class User < ApplicationRecord
    has_many :reading_lists
    has_many :reviews

    def books
        reading_lists.map(&:books).flatten      
    end

    def reading_list_containing(book)
            a = reading_lists.select{|rl| rl.books.include?(book)}
            a[0]
    end
end