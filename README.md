# Olo

Olo is short for Obvious Logger. It allows developers to output a decorated version of an Object (String, Integer, Class, etc) in the rails console.

Best practice is to use Olo in development mode or custom mode (staging, profile, etc.). Using in production could have nasty consequences and just isn't worth the headaches.

## Install

You can add Olo as a gem:

```
gem install o_lo
```

or add it to a Gemfile (Bundler):

```ruby
gem 'o_lo', group: 'development'
```

## Usage

Olo is set up to work from any controller, model, or view.

In a controller or model:

```ruby
Olo.log("something to log", "%", 100)
```

In a view

```
#ERB
<% meaningful_variable = User.email %>
<% Olo.log(meaningful_variable, ":", 42) %>

#HAML
- meaningful_variable = User.email
- Olo.log(meaningful_variable, ":", 42)
```

The arguments for Olo.log are:

- thing: The string, variable, or value of a thing you want to output to the stdout logs _(\* required)_
- decorator: Any string value that will be repeated to provide a visual way to find the output log _(optional, default is "\*")_
- decorator: length: How many times the decorator will be repeated. The max is 200. _(optional, default is 100)_

## Output

```ruby
thing = "Thanks for all the fish"
decorator = "ß"
decorator_length = 42
Olo.log(thing, decorator, decorator_length)
```

```
# output



ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß

Thanks for all the fish

ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß



#end of output
```

## For Developers

You may run the rspec tests with the following:

```
bundle exec rspec spec
```

## TODO

- If the `thing` argument is an object, like `current_user`, add `.inspect` to the "thing"

## Contributing

Looking to contribute or add something to this plucky little project? Bug reports and pull requests are welcome on GitHub at https://github.com/ryanstuhl805/o_lo. This project was started as a hobby and is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The Ruby Gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
