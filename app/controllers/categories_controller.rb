# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category ||= Category.find_by(params[:id])
  end
end
