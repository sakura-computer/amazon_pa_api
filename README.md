# AmazonPaApi

The purpose of this gem is to make use of Amazon Product Advertising API and pull easily Amazon products information.  
Supported Amazon Product Advertising API operations.

* ItemLookup
* ItemSearch
* SimilarityLookup
* BrowseNodeLookup

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

You can use easily Amazon Product Advertising API calls, like this:

```
    AmazonPaApi::ItemLookup.access_key_id = "Your Amazon AWS access key id"
	AmazonPaApi::ItemLookup.secret_access_key = "Your Amazon AWS secret access key"
    AmazonPaApi::ItemLookup.associate_tag = "Your Amazon AWS associate tag"

    item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
    puts item_lookup.get.body     # => XML

    # credentials are handled as class variables
    item_search = AmazonPaApi::ItemSearch.new('Attack on Titan', 'Books')
    puts item_search.get.body     # => XML
```

Or you can set Amazon credentials as hash, like this:

```
    item_search = AmazonPaApi::ItemSearch.new('Attack on Titan', 'Books')
    item_search.credentials = { access_key_id: "Your Amazon AWS access key id",
                                secret_access_key: "Your Amazon AWS secret key",
                                associate_tag: "Your Amazon associate tag"
                              } # required

    puts item_search.get.body     # => XML

    # credentials are handled as class variables
    item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
    puts item_lookup.get.body     # => XML
```

If you want to choice Amazon ECommerce end point:

```
	# :ca, :de, :fr, :jp, :uk or :us.
    item_lookup = AmazonPaApi::ItemLookup.new('B00NLDYGDK', region: :uk)
    puts item_lookup.get.body     # => XML

    # or like this:
    item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
    puts item_lookup.get.body     # => XML

	item_lookup.region = :uk
	item_lookup.item_id = 'B00NLDYGDK'
    puts item_lookup.get.body     # => XML
	
```

You can use Amazon Product Advertising API operation's request parameters as instance methods.

```
    item_lookup.id_type = 'EAN'
	item_lookup.seach_index = 'Books'
    item_lookup.condition = 'New'
    puts item_search.get.body     # => XML	
```

### ItemLookup

```
    item_lookup = AmazonPaApi::ItemLookup.new('B0026IAWMU')
    puts item_lookup.get.body     # => XML

```

### ItemSearch

```
    item_search = AmazonPaApi::ItemSearch.new('Attack on Titan', 'Books')
    puts item_search.get.body     # => XML
```

### SimilarityLookup

```
    similarity_lookup = AmazonPaApi::SimilarityLookup.new('B0026IAWNU')
    puts similarity_lookup.get.body     # => XML
```

### BrowseNodeLookup

```
    browse_node_lookup = AmazonPaApi::BrowseNodeLookup(71443051)
    puts browse_node_lookup.get.body     # => XML
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sakura-computer/amazon_pa_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

