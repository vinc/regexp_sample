RegexpSample
============

A very limited `Regexp#sample` method.


Install
-------

    $ gem install regexp_sample


Usage
-----

```ruby
require "regexp_sample"

using RegexpSample

/[a-z0-9]{5}/.sample #=> "nt3r6"
/app[0-9]{5}/.sample(2) #=> ["app94832", "app04535"]
```
    

Copyright
---------

Copyright (C) 2014 Vincent Ollivier. See LICENSE for details.
