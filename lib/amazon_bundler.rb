# frozen_string_literal: true

require_relative "amazon_bundler/version"
require "error_checking"

# Creates a one-click url to add a bundle of Amazon products to cart
module AmazonBundler
  module_function

  def create_bundle_link(product_array: [], affiliate_id: nil)
    ErrorChecking.product_array_valid?(product_array)
    affiliate_info = affiliate_id ? "AssociateTag=#{affiliate_id}&" : ""
    products_url = convert_products_array_to_url(product_array)
    "#{base_url}#{affiliate_info}#{products_url}"
  end

  def base_url
    "https://www.amazon.com/gp/aws/cart/add.html?"
  end

  def products_with_index(product_array)
    product_array.each_with_index do |product, index|
      product[:index] = index + 1
    end
  end

  def convert_products_array_to_url(product_array)
    product_array = products_with_index(product_array)
    product_array.map { |product| convert_product_to_url(product) }.join("&")
  end

  def convert_product_to_url(product)
    [asin(product), quantity(product), offer(product)].join("&")
  end

  def asin(product)
    "ASIN.#{product[:index]}=#{product[:asin]}"
  end

  def quantity(product)
    "Quantity.#{product[:index]}=#{product[:quantity]}"
  end

  def offer(product)
    offer_id = product[:offer_id].to_s
    offer_id.empty? ? "" : "OfferListingId.#{product[:index]}=#{offer_id}"
  end
end
