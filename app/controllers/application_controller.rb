# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_order

  def current_order
    Order.find_or_create_by(user: current_user, status: :in_progress)
  end
end
