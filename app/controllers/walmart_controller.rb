class WalmartController < ApplicationController
  def index
  end

  def show
    @reviews = WalmartService.new.search_reviews(params['product_id'], params['pattern'])
  end
end
