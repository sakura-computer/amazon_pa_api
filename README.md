# AmazonPaApi

The purpose of this gem is to make use of Amazon Product Advertising API and pull easily Amazon products information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amazon_pa_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amazon_pa_api

## Usage

You can use easily Amazon Product Advertising API calls, like this.
```ruby
	item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
	item_lookup.access_key_id = "Your Amazon AWS access key id"
	item_lookup.secret_access_key = "Your Amazon AWS secret key"
	item_lookup.associate_tag = "Your Amazon associate tag"
	
	puts item_lookup.get.body     # => XML
```
Or you can set Amazon credentials as hash, like this.
```ruby
    credentials = { access_key_id: "Your Amazon AWS access key id",
                    secret_access_key: "Your Amazon AWS secret key",
	 			   	associate_tag: "Your Amazon associate tag"
				  }
    item_search = AmazonPaApi::ItemSearch.new('Attack on Titan', 'Books')
    item_search.credentials = credentials
    puts item_search.get.body     # => XML

	item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
    item_lookup.credentials = credentials
	puts item_lookup.get.body     # => XML
```
If you want to choice Amazon ECommerce end point, like this.
```ruby
	item_lookup = = AmazonPaApi::ItemLookup.new('B0026IAWMU', region: :uk)
```
You can use Amazon Product Advertising API operation's request parameters as instance methods.
```ruby
	item_lookup.id_type = :ean
	item_lookup.condition = :new
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/amazon_pa_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

