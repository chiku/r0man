Overview
--------

*r0man* converts Roman numbers to Indian digits.

Dependencies
------------

*r0man* depends on *simple_validation*. It runs with ruby 1.9+ or compatible versions. Ruby 1.8 isn't supported.

Installation
------------

```script
gem install r0man
```

Usage
------

```ruby
require 'r0man'

m = R0man::Number.parse('IX')
m.value  # 9
m.valid? # true
m.errors # []

n = R0man::Number.parse('VV')
n.value  # 10
n.valid? # false
n.errors # ['V occurs 2 times whereas it is allowed only 1 times']
```

Running tests
-------------

1. Clone the repository.
2. run `bundle` from the root directory.
3. run `rake` from the root directory.

Contributing
------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, but do not mess with the VERSION. If you want to have your own version, that is fine but bump the version in a commit by itself in another branch so I can ignore it when I pull.
* Send me a pull request.

License
-------

This tool is released under the MIT license. Please refer to LICENSE for more details.
