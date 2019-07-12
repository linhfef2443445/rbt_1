class Room < ApplicationRecord
  belongs_to :theater
  has_many :seats, dependent: :destroy
  has_many :movie_theaters, dependent: :destroy
end
