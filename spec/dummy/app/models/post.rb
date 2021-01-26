class Post < ApplicationRecord
  validates :author, :tags, presence: true
end
