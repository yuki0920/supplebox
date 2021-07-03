# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new]

  def new; end

  def show; end

  def index; end
end
