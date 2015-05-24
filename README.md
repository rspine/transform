# Spine::Transform

[![Gem Version](https://badge.fury.io/rb/spine-transform.svg)](http://badge.fury.io/rb/spine-transform)
[![Dependency Status](https://gemnasium.com/rspine/transform.svg)](https://gemnasium.com/rspine/transform)
[![Test Coverage](https://codeclimate.com/github/rspine/transform/badges/coverage.svg)](https://codeclimate.com/github/rspine/transform/coverage)
[![Code Climate](https://codeclimate.com/github/rspine/transform/badges/gpa.svg)](https://codeclimate.com/github/rspine/transform)
[![Codeship Status for rspine/transform](https://codeship.com/projects/3bca5340-e429-0132-2690-16773c71d38d/status?branch=master)](https://codeship.com/projects/81799)

Transforms hash by defined commands. Here we focus on how to transform given
object, `Spine::Mappings` focuses on result and how to retrieve values for it.

## Installation

To install it, add the gem to your Gemfile:

```ruby
gem 'spine-transform'
```

Then run `bundle`. If you're not using Bundler, just `gem install spine-transform`.

## Usage

```ruby
transformations = Spine::Transform.define do
  integer :id
  copy :name
  decimal :price
  boolean :is_available
  transform :available, flatten: true do
    date :from, to: :available_from
    date :until, to: :available_until
  end
end

transformations.transform(
  id: '1',
  name: 'Product',
  price: 1.0,
  is_available: true,
  available: { from: '2014-01-01', until: '2015-01-01' }
)
```
