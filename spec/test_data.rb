# frozen_string_literal: true

# Generate random test data
module TestData
  module_function

  def random_asin
    (0...10).map { rand(65..90).chr }.join
  end

  def random_quantity
    [1, rand(10)].sample
  end

  def random_offer_id
    (0...44).map { rand(65..90).chr }.join
  end

  def random_product
    {
      asin: random_asin,
      quantity: random_quantity,
      offer_id: [nil, random_offer_id].sample
    }
  end

  def random_product_array
    array = []
    rand(10).times { array.push(random_product) }
    array
  end

  def random_invalid_product_array
    [
      { asin: random_asin, quantity: random_quantity },
      [{ asin: random_asin }, { asin: random_asin }],
      [{ quantity: random_quantity }, { quantity: random_quantity }],
      "#{random_asin}, #{random_asin}"
    ].sample
  end
end
