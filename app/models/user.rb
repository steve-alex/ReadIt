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

    def finished_reading
        a = reading_lists.select{|rl| rl.name == "Finished Reading"}
        a[0]
    end

    def favourite_author
        authors_array = books.map { |book| book.authors }
        authors_array.max_by {|author| authors_array.count(author) }
    end

    def favourite_category
        categories_array = books.map { |book| book.categories }
        categories_array.max_by {|categories| categories_array.count(categories) }
    end

end