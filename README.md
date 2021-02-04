# Cobalt RuboCop

This repository provides recommended linting rules for Ruby repositories.

## Installation

### Gemfile

```ruby
group :development do
  gem 'cobalt-rubocop', require: false, git: 'https://github.com/cobalthq/cobalt-rubocop', branch: :main
end
```

### .rubocop.yml

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
