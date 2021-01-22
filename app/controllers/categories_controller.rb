# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @products = Product.all
  end
end
