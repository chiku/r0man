![Build Status](https://github.com/chiku/r0man/actions/workflows/build.yml/badge.svg)

Overview
--------

*r0man* converts Roman numbers to Indian digits.

Dependencies
------------

*r0man* depends on *simple_validation*. It runs with ruby 2.7+ or compatible versions.

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

License
-------

This tool is released under the MIT license. Please refer to LICENSE for more details.
