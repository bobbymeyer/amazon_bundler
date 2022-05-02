# frozen_string_literal: true

# Check for valid data, provide helpful errors if not
module ErrorChecking
  module_function

  def product_array_valid?(product_array)
    errors = []
    errors.push("AmazonBundler expects an Array of Products") unless product_array.is_a?(Array) || !product_array.empty?
    product_array.each do |product|
      product_valid?(product, errors)
    end
    raise StandardError.new(errors.join("\n")) unless errors.empty?
  end

  def product_valid?(product, errors)
    valid_hash = product.is_a?(Hash)
    errors.push("AmazonBundler expects Products to be a Hash") unless valid_hash
    return unless valid_hash

    errors.push("AmazonBundler expects Products to have an ASIN") unless product.key?(:asin) || !product[:asin].to_s.empty?
    errors.push("AmazonBundler expects Products to have a Quantity") unless product.key?(:quantity) || !product[:quantity].to_s.empty?
  end
end
