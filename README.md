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

## Why not use `find_by`?
`find_by` doesn't verify uniqueness. The Rails documentation for the method says:
>Finds the first record matching the specified conditions. There is no implied ordering so if order matters, you should specify it yourself.

Therefore, given the following records:

```
#<Record id: 1, name: "Alice", color: "red">,
#<Record id: 2, name: "Bob", color: "blue">,
#<Record id: 3, name: "Bob", color: "green">
```

The following expression has **undefined behavior**:

```ruby
Record.find_by(name: "Bob")    # could return record 2 or record 3!
```
The record returned is whatever the database decides is first. There's no way to tell from the code alone which it will be, or that such a thing has even happened. In other words, `find_by` is only safe when you specify the order of rows, or have confidence that no more than one row will match—usually thanks to a uniqueness constraint in the database.

If you expect only one row to match but don't have a database uniqueness constraint (perhaps due to non-unique legacy data, for example), you would need to do something like:
```ruby
raise unless Record.where(name: "Bob").count == 1
Record.find_by(name: "Bob")
```
Or, with this gem:
```ruby
Record.where(name: "Bob").one!
```

## Shouldn't this be provided by Rails?
Probably. See https://github.com/rails/rails/pull/26206.

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
