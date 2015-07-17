[WIP] Separator
===============

[![Gem Version](https://img.shields.io/gem/v/separator.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/separator/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/separator.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/separator.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/separator.svg?style=flat)][coveralls]
[![Inline docs](http://inch-ci.org/github/nepalez/separator.svg)][inch]

[codeclimate]: https://codeclimate.com/github/nepalez/separator
[coveralls]: https://coveralls.io/r/nepalez/separator
[gem]: https://rubygems.org/gems/separator
[gemnasium]: https://gemnasium.com/nepalez/separator
[travis]: https://travis-ci.org/nepalez/separator
[inch]: https://inch-ci.org/github/nepalez/separator

Composable multi-type conditions.

Synopsis
--------

### White Lists

```ruby
separator = Separator.new only: [:foo, :qux]
separator[:foo] # => true
separator[:bar] # => false

separator = Separator.new only: /foo/
separator[:foobar] # => true
separator[:bar]    # => false

separator = Separator.new only: 1..3
separator[2.4] # => true
separator[0]   # => false

separator = Separator.new only: -> value { value.is_a? Hash }
separator[foo: :FOO] # => true
separator[:foo]      # => false
```

### Black Lists

```ruby
separator = Separator.new except: [:bar, :qux]

separator[:foo] # => true
separator[:bar] # => false
```

### Negation

```ruby
separator = Separator.new except: /bar/

!separator[:foo] # => false
!separator[:bar] # => true
```

### Algebra

```ruby
blacklist = Separator.new except: /bar/
whitelist = Separator.new only: /foo/

separator = whitelist & blacklist

separator[:foobaz] # => true
separator[:foobar] # => false
```

```ruby
blacklist = Separator.new except: /bar/
whitelist = Separator.new only: /foo/

separator = whitelist - blacklist # = whitelist + !blacklist

separator[:foobaz] # => false
separator[:foobar] # => true
```

```ruby
blacklist = Separator.new except: 1..5
whitelist = Separator.new only: 4..8

separator = whitelist | blacklist # = !(!whitelist + !blacklist)
separator[0]   # => true
separator[2.5] # => false
separator[10]  # => true
```

### Immutability:

```ruby
Separator.new.frozen? # => true
```

Installation
------------

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem "separator"
```

Then execute:

```
bundle
```

Or add it manually:

```
gem install separator
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
* [Fork the project](https://github.com/nepalez/separator)
* Create your feature branch (`git checkout -b my-new-feature`)
* Add tests for it
* Commit your changes (`git commit -am '[UPDATE] Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create a new Pull Request

License
-------

See the [MIT LICENSE](LICENSE).
