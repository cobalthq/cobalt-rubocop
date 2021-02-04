# Cobalt RuboCop

This repository provides recommended linting rules for Ruby repositories.

## Installation

### Gemfile

```ruby
group :development do
  gem "cobalt-rubocop", require: false, git: https://github.com/cobalthq/cobalt-rubocop
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
