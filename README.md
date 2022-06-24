# Cobalt RuboCop
[![Gem Version](https://badge.fury.io/rb/cobalt-rubocop.svg)](https://badge.fury.io/rb/cobalt-rubocop)
[![GitHub License](https://img.shields.io/github/license/cobalthq/cobalt-rubocop.svg)](https://github.com/cobalthq/cobalt-rubocop/blob/main/LICENSE)
![Gem Downloads](https://img.shields.io/gem/dt/cobalt-rubocop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

This repository provides recommended linting rules for Ruby repositories.

## Installation

### Gemfile
#### Add
  ```ruby
  group :development do
    gem 'cobalt-rubocop', require: false
  end
  ```

#### Remove
  ```ruby
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  ```

  [Specific versions](https://github.com/cobalthq/cobalt-rubocop/blob/main/cobalt-rubocop.gemspec) installed for:
  - [rubocop](https://github.com/rubocop-hq/rubocop)
  - [rubocop-performance](https://github.com/rubocop/rubocop-performance)
  - [rubocop-rails](https://github.com/rubocop/rubocop-rails)
  - [rubocop-rspec](https://github.com/rubocop/rubocop-rspec)

### .rubocop.yml
Configuration Options:
```yaml
inherit_gem:
  cobalt-rubocop:
    - 'config/default.yml'
    - 'config/rails.yml'
    - 'config/rspec.yml'
```

## Usage

```shell
bundle install
bundle exec rubocop
```

When installing rules on an older project it is possible to generate a todo list:

```shell
bundle exec rubocop --auto-gen-config --auto-gen-only-exclude --exclude-limit 40000
```

The number of offences can be counted:

```shell
grep "Offense count" .rubocop_todo.yml | awk -F: '{sum+=$2} END {print sum}'
```

## Custom Cops
### InsecureHashAlgorithm
See [Ruby Docs](https://ruby-doc.org/stdlib-2.7.2/libdoc/openssl/rdoc/OpenSSL/Digest.html) for built in hash functions.

- Default Configuration:
  ```yml
  Cobalt/InsecureHashAlgorithm:
    Allowed:
      - SHA256
      - SHA384
      - SHA512
  ```

  ```ruby
  # bad
  OpenSSL::Digest::MD5.digest('abc')
  OpenSSL::Digest::SHA1.digest('abc')
  OpenSSL::HMAC.new('abc', 'sha1')

  # good
  OpenSSL::Digest::SHA256.digest('abc')
  OpenSSL::Digest::SHA384.digest('abc')
  OpenSSL::Digest::SHA512.digest('abc')
  OpenSSL::HMAC.new('abc', 'sha256')
  ```

## Development
```shell
git clone git@github.com:cobalthq/cobalt-rubocop.git
bundle install
```

### Testing locally
In your application, use the `path` attribute to point to your local copy of the gem
```ruby
  # Use the relative path from your application, to the cobalt-rubocop folder
  gem 'cobalt-rubocop', path: '../cobalt-rubocop', require: false
```

Alternatively:
- `rake build`
- `gem install pkg/cobalt-rubocop-<version_number>.gem`

## Publish (internal)
> Note: Publishing a new version of this gem is only meant for maintainers.
- Ensure you have access to publish on [rubygems](https://rubygems.org/gems/cobalt-rubocop).
- Update [CHANGELOG](https://github.com/cobalthq/cobalt-rubocop/blob/main/CHANGELOG.md).
- Update [`VERSION`](https://github.com/cobalthq/cobalt-rubocop/blob/main/lib/rubocop/cobalt/version.rb).
- `rake release`
  - This command builds the gem, creates a tag and publishes to rubygems, see [bundler docs](https://bundler.io/guides/creating_gem.html#releasing-the-gem).
