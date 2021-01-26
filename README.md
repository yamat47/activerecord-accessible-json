# ActiveRecord Accessible Json

Using this gem, ActiveRecord JSON typed attribute is deserialized into HashWithIndifferentAccess if possible.

## Example

```ruby
# Both author and tags are JSON typed columns.
Post.create(author: { 'name': 'yamat47', 'age': 27 }, tags: %w[Rails TDD])

post = Post.last
post.author.class #=> ActiveSupport::HashWithIndifferentAccess
post.author['name'] #=> 'yamat47'
post.author['name'] == post.author[:name] #=> true

post.author = { name: 'Andy', age: 30 }
post.author.class #=> ActiveSupport::HashWithIndifferentAccess
post.author['name'] #=> 'Andy'
post.author['name'] == post.author[:name] #=> true

# If attribute's value is not changeable into HashWithIndifferentAccess,
# this gem does nothing.
post.tags.class #=> Array
```

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'activerecord_accessible_json'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install activerecord_accessible_json
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
