class User < ApplicationRecord
    has_many :reading_lists
    has_many :reviews
end