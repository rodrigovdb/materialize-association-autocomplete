# Materialize Association Autocomplete

Provides autocomplete for associations, using materialize-sass and simple_form.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'materialize-association-autocomplete'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install materialize-association-autocomplete

## Usage

Instead of uses `= f.associaton :model_name`, changes for `= f.input :model_name, as: :autocomplete`.

```ruby
= simple_form_for(@child_model) do |f|
  = f.error_notification
  = f.error_notification message: f.object.errors[:base].to_sentence if f.object.errors[:base].present?

  .row
    .col.s10.input-field
      = f.input :parent_model_name, as: :autocomplete
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/materialize-association-autocomplete. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html).
