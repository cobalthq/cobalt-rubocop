# Cobalt RuboCop

[![Gem Version](https://badge.fury.io/rb/cobalt-rubocop.svg)](https://badge.fury.io/rb/cobalt-rubocop)
[![GitHub License](https://img.shields.io/github/license/cobalthq/cobalt-rubocop.svg)](https://github.com/cobalthq/cobalt-rubocop/blob/main/LICENSE)
![Gem Downloads](https://img.shields.io/gem/dt/cobalt-rubocop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

## Description

This repository provides recommended linting rules for Ruby repositories.

## Contributing

If you wish to contribute, please check our guidelines in
[CONTRIBUTING.md]

## Who to ask for help

Ask the [CODEOWNERS]

## Installation

### Gemfile

#### Add

```ruby
source 'https://rubygems.pkg.github.com/cobalthq' do
  group :development do
    gem 'cobalt-rubocop', require: false
  end
end
```

#### Remove

```ruby
gem 'rubocop', require: false
gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
```

[Specific versions] installed for:

- [rubocop]
- [rubocop-performance]
- [rubocop-rails]
- [rubocop-rspec]

### .rubocop.yml

Configuration Options:

```yaml
inherit_gem:
  cobalt-rubocop:
    - "config/default.yml"
    - "config/rails.yml"
    - "config/rspec.yml"
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

<!-- Links -->

[CODEOWNERS]: ./CODEOWNERS
[CONTRIBUTING.md]: ./CONTRIBUTING.md
[Specific versions]: ./cobalt-rubocop.gemspec
[rubocop-performance]: https://github.com/rubocop/rubocop-performance
[rubocop-rails]: https://github.com/rubocop/rubocop-rails
[rubocop-rspec]: https://github.com/rubocop/rubocop-rspec
[rubocop]: https://github.com/rubocop-hq/rubocop
