# AmazonBundler
AmazonBundler provides a simple way to generate Amazon Add to Cart URLs, enabling users to add multiple items to their cart with one click.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'amazon_bundler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install amazon_bundler

## Usage
AmazonBundler takes an array of product hashes. A product hash must have an **asin** and a **quantity**. It may also take an **offer_id**, but this is *optional*.

In addition, you can provide your affiliate link, to get receive your affiliate credit.

### Example
```
require 'amazon_bundler'

product_array = [
  {
    asin: 'B08XTJG6PQ',
    quantity: 1
  },
  {
    asin: 'B07GPFDL1K',
    quantity: 2
  },
  {
    asin: 'B07MK1N7P6',
    quantity: 2
  },
  {
    asin: 'B00V3MOMNA',
    quantity: 1,
    offer_id: 'Z23WCMaJHdbtXgLg2BaB4YNayMTs4SDiq5lHXoOUGpZe'
  }
]

puts AmazonBundler.create_bundle_link(product_array: product_array, affiliate_id: ENV['YOUR_AFFILIATE_CODE'])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/amazon_bundler.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
