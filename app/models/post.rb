# frozen_string_literal: true

# this is post model
class Post < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
