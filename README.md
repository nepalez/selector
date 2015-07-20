Selector
========

[![Gem Version](https://img.shields.io/gem/v/selector.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/selector/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/selector.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/selector.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/selector.svg?style=flat)][coveralls]
[![Inline docs](http://inch-ci.org/github/nepalez/selector.svg)][inch]

[codeclimate]: https://codeclimate.com/github/nepalez/selector
[coveralls]: https://coveralls.io/r/nepalez/selector
[gem]: https://rubygems.org/gems/selector
[gemnasium]: https://gemnasium.com/nepalez/selector
[travis]: https://travis-ci.org/nepalez/selector
[inch]: https://inch-ci.org/github/nepalez/selector

Composable multi-type conditions.

Synopsis
--------

### White Lists

```ruby
selector = Selector.new only: [:foo, :qux]
selector[:foo] # => true
selector[:bar] # => false

selector = Selector.new only: /foo/
selector[:foobar] # => true
selector[:bar]    # => false

selector = Selector.new only: 1..3
selector[2.4] # => true
selector[0]   # => false

selector = Selector.new only: -> value { value.is_a? Hash }
selector[foo: :FOO] # => true
selector[:foo]      # => false
```

### Black Lists

```ruby
selector = Selector.new except: [:bar, :qux]

selector[:foo] # => true
selector[:bar] # => false
```

### Negation

```ruby
blacklist = Selector.new except: /bar/
selector = !blacklist

selector[:bar] # => true
selector[:foo] # => false
```

### Algebra

```ruby
blacklist = Selector.new except: /bar/
whitelist = Selector.new only: /foo/

selector = whitelist & blacklist

selector[:foobaz] # => true
selector[:foobar] # => false
```

```ruby
blacklist = Selector.new except: /bar/
whitelist = Selector.new only: /foo/

selector = whitelist - blacklist # = whitelist + !blacklist

selector[:foobar] # => true
selector[:foo] # => false
selector[:bar] # => false
```

```ruby
blacklist = Selector.new except: 1..5
whitelist = Selector.new only: 4..8

selector = whitelist | blacklist # = !(!whitelist + !blacklist)
selector[0.5] # => true
selector[5.5] # => true
selector[2.5] # => false
```

### Immutability:

```ruby
Selector.new.frozen? # => true
```

Installation
------------

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem "selector"
```

Then execute:

```
bundle
```

Or add it manually:

```
gem install selector
```

Compatibility
-------------

Tested under rubies [compatible to MRI 1.9.3+](.travis.yml).

Uses [RSpec] 3.0+ for testing and [hexx-suit] for dev/test tools collection.

[RSpec]: http://rspec.org
[hexx-suit]: https://github.com/nepalez/hexx-suit

Contributing
------------

* Read the [STYLEGUIDE](config/metrics/STYLEGUIDE)
* [Fork the project](https://github.com/nepalez/selector)
* Create your feature branch (`git checkout -b my-new-feature`)
* Add tests for it
* Commit your changes (`git commit -am '[UPDATE] Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create a new Pull Request

License
-------

See the [MIT LICENSE](LICENSE).
