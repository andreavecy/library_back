class Book < ApplicationRecord
  belongs_to :author
  has_many :favorite_books
end
