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
  - `rubocop`
  - `rubocop-performance`
  - `rubocop-rails`
  - `rubocop-rspec`

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

## Development
```shell
git clone git@github.com:cobalthq/cobalt-rubocop.git
gem install bundler:2.2.2
bundle _2.2.2_
```

### Testing locally
In your application, use the `path` attribute to point to your local copy of the gem
```ruby
  # Use the relative path from your application, to the cobalt-rubocop folder
  gem 'cobalt-rubocop', path: '../cobalt-rubocop', require: false
```

### Publishing the gem
If you have access to publish the gem on rubygems:
```shell
rake build
cd pkg
gem push cobalt-rubocop-<version_number>.gem
```
