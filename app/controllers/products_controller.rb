# frozen_string_literal: true

class ProductsController < ApplicationController

  def show
    @order = current_order
  end
end
