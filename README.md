# SourceMatchers (for RSpec)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'source-matchers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install source-matchers

## Usage

```ruby
require 'source-matchers'

RSpec.configure do |config|
  config.include(SourceMatchers::Rspec)
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
