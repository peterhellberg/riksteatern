# Riksteatern

A small Ruby client for the Riksteatern API.

You can find out more about the API (In Swedish) on [http://data.riksteatern.se/](http://data.riksteatern.se/).

[![Build Status](https://travis-ci.org/peterhellberg/riksteatern.png?branch=master)](https://travis-ci.org/peterhellberg/riksteatern)
[![Gem Version](https://badge.fury.io/rb/riksteatern.png)](http://badge.fury.io/rb/riksteatern)

## Dependencies

No runtime dependencies. Bundler, Rake and Minitest are required for development.

## Installation

Add this line to your application's Gemfile:

    gem 'riksteatern'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install riksteatern

## Usage

*You need to be authenticated to use the API.*

**Access request: [http://data.riksteatern.se/ansokan/](http://data.riksteatern.se/ansokan/)**

```ruby
Riksteatern.account('<USERNAME>', '<PASSWORD>')
```

Now you are ready to start fetching data :)

```ruby
# Find an event by id
e = Riksteatern::Event.find(992423)
e.name #=> "En mans föreställning"

# Number of events in Stockholms län
Riksteatern::Event.all(regionName: 'Stockholms län').size #=> 46

# Find a venue by id
v = Riksteatern::Venue.find(2260101)

## The region name of the location
v.location.region #=> "Västernorrlands län"

## Print the address of the venue
puts v.address

# Find a production by id
p = Riksteatern::Production.find(42)

## Get the number of pictures
p.pictures.size #=> 4

## Get the categories of the production
p.categories #=> ["Barn/Skola", "Teater", "Mim", "Musikteater"]
```

You might also want to take a look at the `specs`

## Suggestions for improving the API

 * Correct the spelling of `accesibility` *sic*
 * Change `category` to `categories` since it is a list
 * Upper limit on how many results to return
 * Pagination of results

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
