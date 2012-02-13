# io-statsd

This is a [StatsD](https://github.com/etsy/statsd)
client for [Io](http://www.iolanguage.com/).

The use is super simple, and all messages are sent via UDP,
with no failure callbacks.

``` io
stats = StatsD clone
stats host = "127.0.0.1" # default
stats port = 8125 # default
stats prefix = "companyname." # default none
```

And then you can hit up the `#time` or `#count` methods:

``` io
stats count("thing", 20)
stats time("otherthing", 20)

stats increment("thing") # count 1
stats decrement("thing") # count -1
```

Very useful to time actions, like:

``` io
stats time(
  Date cpuSecondsToRun(
    # do something
  ) * 1000
)
```

## Running the tests

To run the tests, check out a copy of the repository, and then run `make`.

## Author

John Crepezzi (john.crepezzi@gmail.com)

## License

(The MIT License)

Copyright © 2012 John Crepezzi

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the ‘Software’), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
