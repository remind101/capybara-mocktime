# Capybara Mocktime

A Ruby gem for synchronizing time between the browser and tests using Timecop
and Sinon.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capybara-mocktime'
```

Include the rack middleware to inject the fake time into the document.

```ruby
Capybara.app = Rack::Builder.app do
  use Rack::Mocktime
  run App
end
```

### RSpec

```ruby
require 'capybara/mocktime/rspec'
```

## Usage

### RSpec

Tag your specs with a `mock_time` value:


```ruby
context 'when the browser time is 8:30am', mock_time: '8:30am' do
  it 'does something'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
