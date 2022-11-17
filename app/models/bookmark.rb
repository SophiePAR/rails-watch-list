class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates_length_of :comment, minimum: 6
  validates :movie_id, uniqueness: { scope: :list_id }
end
