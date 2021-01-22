# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, presence: true
  has_many :products, dependent: :destroy
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', optional: true
end
