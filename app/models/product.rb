# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :price, :description, presence: true
  belongs_to :category
  has_many :order_items
  has_many :comments

  def rating
    return 0 if comments.empty?

    comments.sum(&:rating).to_f / comments.count || 0
  end
end
