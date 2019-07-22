class MovieTheater < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  belongs_to :room
  has_many :order_items, dependent: :destroy

  scope :date_like, ->(date) { where "time LIKE ?", "%#{date}%" }
  scope :movie_like, ->(movie_id) { where "movie_id = ?", movie_id.to_s }
end
