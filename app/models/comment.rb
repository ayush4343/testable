# frozen_string_literal: true

class Comment < ApplicationRecord
    validates :name, presence: true
end
