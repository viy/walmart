require 'open-uri'
require 'net/http'

class WalmartService
  def product_reviews(product_id)
    uri = URI("http://api.walmartlabs.com/v1/reviews/#{product_id}?apiKey=vpw2mgckhsryu2c93w9a8jj8&format=json")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def search_reviews(product_id, pattern)
    reviews = product_reviews(product_id)['reviews']
    reviews.select {|review| review['reviewText'].include?(pattern)}
  end
end