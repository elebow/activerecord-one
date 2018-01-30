# activerecord-one

Provides `ActiveRecord::Relation#one!`, a convenience method that asserts a relation contains exactly one record and returns it. If there are no records or more than one, an `ActiveRecord::NoRecordFound` or `ActiveRecord::MultipleRecordsFound` exception is raised, respectively.

`#one!` reads as follows:

```ruby
def one!
  case size
  when 0
    raise ActiveRecord::NoRecordFound
  when 1
    first
  else
    raise ActiveRecord::MultipleRecordsFound
  end
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activerecord-one'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activerecord-one
```

## License
This gem is dedicated to the public domain. In jurisdictions where this is not possible, this gem is licensed to all under the least restrictive terms possible, and all copyright rights are waived.
