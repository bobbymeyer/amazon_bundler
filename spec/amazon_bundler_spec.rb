# frozen_string_literal: true

require "test_data"
require "uri"

RSpec.describe AmazonBundler do
  it "has a version number" do
    expect(AmazonBundler::VERSION).not_to be nil
  end

  it "Returns an error unless it gets a valid product array" do
    expect do
      AmazonBundler.create_bundle_link(product_array: TestData.random_invalid_product_array)
    end.to raise_error(StandardError)
  end

  it "Returns a url" do
    url = AmazonBundler.create_bundle_link(product_array: TestData.random_product_array)
    uri = URI.parse(url)
    expect(uri.scheme).to eq("https")
  end
end
