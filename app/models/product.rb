# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :price, :description, presence: true
  belongs_to :category
  has_many :order_items
  has_many :comments

  def rating
    comments.sum(&:rating) / comments.count
  end
end
