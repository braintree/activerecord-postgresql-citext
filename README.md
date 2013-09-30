# ActiveRecord support for citext

Adds support for citext to active_record

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-postgres-citext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-postgres-citext

## Usage

In a database migration you need to first enable `citext` as an extension, then you can create columns of type citext.

```ruby
def up
  enable_extension("citext")                   
                                             
  create_table :models, :force => true do |t|  
    t.citext :name                             
    t.timestamps                               
  end                                          
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
