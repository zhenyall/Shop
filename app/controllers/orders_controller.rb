# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_current_order

  def index

  end

  def show
    @items = current_order.order_items
  end

  def update
    current_product = @order.order_items.find_by(product_id: params[:product_id])

    if current_product.present?
      current_product.update(quantity: current_product.quantity + 1)
    else
      @order.order_items.create(product_id: params[:product_id], quantity: 1)
    end

    redirect_to order_path(current_order)
  end

  def complete
    OrderMailer.with(user: current_user).complete_order.deliver_now
    redirect_to root_path
  end

  private

  def set_current_order
    @order = current_order
  end
end
