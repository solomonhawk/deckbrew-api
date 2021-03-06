# gzip [![wercker status](https://app.wercker.com/status/186d65e4d8160cf274ffc5835e6d9795 "wercker status")](https://app.wercker.com/project/bykey/186d65e4d8160cf274ffc5835e6d9795)
Gzip middleware for Martini.

[API Reference](http://godoc.org/github.com/martini-contrib/gzip)

## Usage

~~~ go
import (
  "github.com/codegangsta/martini"
  "github.com/martini-contrib/gzip"
)

func main() {
  m := martini.Classic()
  // gzip every request
  m.Use(gzip.All())
  m.Run()
}

~~~

Make sure to include the Gzip middleware above other middleware that alter the response body (like the render middleware).

## Authors
* [Jeremy Saenz](http://github.com/codegangsta)
* [Shane Logsdon](http://github.com/slogsdon)
