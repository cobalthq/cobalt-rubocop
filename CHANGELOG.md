# CHANGELOG

## main (unreleased)

* Maintenance:
  * Add CI status checks
  * Add dependabot
  * Add required CI checks for IaaC setup

## 1.0.0 (2023-06-09)

* Bump required ruby version to 3.2.x
* Add default settings:

```yaml
RSpec/IndexedLet:
  Enabled: false

RSpec/Rails/InferredSpecType:
  Enabled: false

Style/RedundantConstantBase:
  Enabled: false

Style/TrailingCommaInArguments:
  EnforcedStyleForMultiline: consistent_comma

Style/TrailingCommaInArrayLiteral:
  EnforcedStyleForMultiline: consistent_comma

Style/TrailingCommaInHashLiteral:
  EnforcedStyleForMultiline: consistent_comma
```

## 0.9.0 (2023-04-20)

* Allow either hash syntax (legacy vs 3.1) as long as the use is consistent.

## 0.8.0 (2023-04-04)

* Relax dependency versions

## 0.7.0 (2022-08-24)

* Update Gem versions: ([#12](https://github.com/cobalthq/cobalt-rubocop/pull/12))

## 0.6.0 (2022-06-24)

* Update Gem versions: ([#11](https://github.com/cobalthq/cobalt-rubocop/pull/11))
* Security: Require Multi-Factor Authentication for RubyGems privileged operations ([#10](https://github.com/cobalthq/cobalt-rubocop/pull/10))

## 0.5.0 (2022-01-25)

* Update Gem versions ([#8](https://github.com/cobalthq/cobalt-rubocop/pull/8))

## 0.4.0 (2021-09-07)

* Update Gem versions ([#7](https://github.com/cobalthq/cobalt-rubocop/pull/7))

## 0.3.0 (2021-04-16)

* Update Rubocop and Rubocop Performance versions ([#6](https://github.com/cobalthq/cobalt-rubocop/pull/6))

## 0.2.0 (2021-04-14)

* Avoid warnings on RSpec `let` with parameter arrays ([#5](https://github.com/cobalthq/cobalt-rubocop/pull/5))
* Add new cop `InsecureHashAlgorithm`. ([#3](https://github.com/cobalthq/cobalt-rubocop/pull/3))

## 0.1.0 (2021-02-10)

* Introduce default rules
* Introduce rails rules
* Introduce rspec rules
