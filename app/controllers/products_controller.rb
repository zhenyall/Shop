# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products ||= if params[:category_id].present?
                    Category.find_by(id: params[:category_id]).products
                  else
                    Product.all
                  end
  end

  def show
    @order = current_order
  end
end
