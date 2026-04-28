<p align="center">
  <img src="https://www.seven.io/wp-content/uploads/Logo.svg" width="250" alt="seven logo" />
</p>

<h1 align="center">seven SMS for Solidus</h1>

<p align="center">
  Send bulk SMS to your <a href="https://solidus.io/">Solidus</a> customers via the seven gateway.
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-teal.svg" alt="MIT License" /></a>
  <img src="https://img.shields.io/badge/Solidus-3.x-blue" alt="Solidus 3.x" />
  <img src="https://img.shields.io/badge/Ruby-2.7%2B-red" alt="Ruby 2.7+" />
  <a href="https://rubygems.org/gems/solidus_seven"><img src="https://img.shields.io/gem/v/solidus_seven" alt="Gem" /></a>
</p>

---

## Features

- **Bulk SMS** - Reach all customers in one go
- **Country Filter** - Limit recipients to a specific country
- **Multiple Auth Sources** - Configure the API key via `SevenConfiguration[:api_key]`, `ENV['SEVEN_DUMMY_API_KEY']` or `ENV['SEVEN_API_KEY']` (in that order)

## Prerequisites

- A [Solidus](https://solidus.io/) installation (Rails 6+)
- A [seven account](https://www.seven.io/) with API key ([How to get your API key](https://help.seven.io/en/developer/where-do-i-find-my-api-key))

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'solidus_seven'
```

Install dependencies and run the install generator:

```bash
bundle install
bin/rails generate solidus_seven:install
```

## Configuration

The API key is resolved (in order):

1. `SevenConfiguration[:api_key]`
2. `ENV['SEVEN_DUMMY_API_KEY']`
3. `ENV['SEVEN_API_KEY']`

Set whichever fits your deployment.

## Development

### Run the test suite

```bash
bin/rake
```

`bin/rake` defaults to building the dummy Solidus app if it does not exist, then runs specs. Regenerate the dummy app via `bin/rake extension:test_app`.

For static analysis:

```bash
bundle exec rubocop
```

When testing applications integrating with this gem, load the factories:

```ruby
require 'solidus_seven/testing_support/factories'
```

Or, if you use `FactoryBot.definition_file_paths`, load Solidus core factories together with this extension:

```ruby
SolidusDevSupport::TestingSupport::Factories.load_for(SolidusSeven::Engine)
```

### Run the sandbox

`bin/sandbox` boots a sandbox Solidus app under `./sandbox`. `bin/rails` forwards any Rails command to `sandbox/bin/rails`:

```bash
bin/rails server
```

## Support

Need help? Feel free to [contact us](https://www.seven.io/en/company/contact/) or [open an issue](https://github.com/seven-io/solidus/issues).

## License

[MIT](LICENSE)
