class ReadingListBook < ApplicationRecord
    belongs_to :book
    belongs_to :reading_list
end