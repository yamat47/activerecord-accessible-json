# frozen_string_literal: true
class Post < ApplicationRecord
  validates :author, :tags, presence: true
end
