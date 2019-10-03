class User < ApplicationRecord
    has_many :reading_lists
    has_many :reviews, dependent: :destroy

    def books
        reading_lists.map(&:books).flatten      
    end

    def reading_list_containing(book)
        a = reading_lists.select{|rl| rl.books.include?(book)}
        a[0]
    end

    def finished_reading
        a = reading_lists.select{|rl| rl.name == "Finished Reading"}
        a[0]
    end


    def books_in(readinglist)
        
    end

end