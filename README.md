# Mockjax [![travis-ci](https://secure.travis-ci.org/ejholmes/mockjax.png)](https://secure.travis-ci.org/ejholmes/mockjax)

Mockjax gem for rails and rack applications. Define javascript mocks in your
request specs

## Installation

Add this line to your application's Gemfile:

    gem 'mockjax'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mockjax

## Usage
Assuming you're using capybara...

### Rack

```ruby
# spec/spec_helper.rb
Capybara.app = Rack::Build.new {
    use Rack::Mockjax
    run MyApp
}
```

#### Rails 3

```ruby
# config/initializers/test.rb
config.middleware.use Rack::Mockjax
```

Then define your stubs like you would with any other stubbing library:

```ruby
before do
  mockjax url: '/test', responseText: { message: 'hello world' }
end
```

Now we can make requests to `/test` from javascript and our mock will be used.
Awesome!

```coffeescript
$.getJSON '/test', (data) -> console.log(data.message)
# => 'hello world'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
