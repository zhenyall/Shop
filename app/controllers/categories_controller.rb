# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @products = Product.all
  end

  def index
    @products = Product.search(params[:q]).includes(:category)
  end
end
