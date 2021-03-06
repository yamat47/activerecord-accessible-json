[![Gem Version](https://badge.fury.io/rb/activerecord_accessible_json.svg)](https://badge.fury.io/rb/activerecord_accessible_json)

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

## Version Compatibility

| | Rails 5.2 | Rails 6.0 | Rails 6.1 | Rails head |
| :---: | :---: | :---: | :---: | :---: |
| Ruby 2.5 | ✅ | ✅ | ✅ | ❌ |
| Ruby 2.6 | ✅ | ✅ | ✅ | ❌ |
| Ruby 2.7 | ✅ | ✅ | ✅ | ✅ |
| Ruby 3.0 | ❌ | ✅ | ✅ | ✅ |
| Ruby head | ❌ | ✅ | ✅ | ✅ |

Version compatibility is checked everyday on [CI](https://github.com/yamat47/activerecord_accessible_json/actions).

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

## Release

1. [Check if CI is passed on `main`.](https://github.com/yamat47/activerecord_accessible_json/actions)
1. Decide next versioning and update [version.rb](https://github.com/yamat47/activerecord_accessible_json/blob/v0.2.0/lib/activerecord_accessible_json/version.rb).
1. `bundle install`.
1. Commit these changes with happy message (like "Release v0.2.0 🎉").
1. `ghch --format=markdown --next-version={{ NEXT_VERSION }}` to generate changelog.
1. [Create new release.](https://github.com/yamat47/activerecord_accessible_json/releases/new)
1. `bundle exec rake build`.
1. `bundle exec rake release`.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
