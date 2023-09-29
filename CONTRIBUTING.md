# Contributing to Cobalt RuboCop

Welcome and thank you for considering contributing to Cobalt RuboCop.

Thank you for contributing to our project!
We provide the following guidelines to make the contribution process easy
and effective for everyone involved.

## Signed Commits
In this repositiory we enforce [signing commits with GPG signature](https://zombie.atlassian.net/wiki/spaces/ENG/pages/2387312988).

## PR Branch Naming

In Cobalt RuboCop we use `/` as a separator of branch name parts. The parts are
as follows:

```text
<Contribution Category>/<Ticket Reference>/<very-short-summary>
```

The ticket has to be referenced by its ID (key)
in CAPITAL LETTERS with a hyphen «-» (e.g. «PX-2631», «INFRA-234», etc.).

In some cases, it's allowed to merge a PR without a ticket.
In that case the «Ticket Reference» part needs to be replaced with «NO-TICKET»
in CAPITAL LETTERS.

### Contribution Categories

Include one of the following categories as a preface for the branch name:

* `feature` — Add new functionality, implement new features, create new user
  scenarios;
* `fix` — Fix a bug, security issue, or incorrect behavior;
* `chore` or `maintenance` — Refactor, change implementation details, update
  multiple dependencies in one go;
* `docs` — (may use `NO-TICKET`, except for doc repositories) — Update
  documentation;
* `revert-NNN-` — Automated prefix from GitHub when reverting a PR. Assume
  that the PR being reverted was merged and already passed branch name check;
* `dependabot` — Update dependencies. Breaks branch naming rules (April 2022).
* `snyk-upgrade` — Update dependencies. Breaks branch naming rules (April 2022).
  We allow dependabot merges *without a ticket* as long as it does not
  break anything

#### Good

* `fix/PX-1234/ensure-bids-ac` <!--- branch-name pass -->
* `docs/NO-TICKET/fix-typo` <!--- branch-name pass -->
* `maintenance/PX-3455/update-spring` <!--- branch-name pass -->
* `revert-123-anything/was/already-merged` <!--- branch-name pass -->
* `dependabot/whatever/version-1.2.3` <!--- branch-name pass -->
* `snyk-upgrade-1234567abcdef` <!--- branch-name pass -->
* `chore/INFRA-1234/Anything_At_All-1.0.1` <!--- branch-name pass -->

#### Bad

| Example                                   | Problem                                                        |
|-------------------------------------------|----------------------------------------------------------------|
| `chore/px-1345/implement-cookie-check`    | Ticket ID is in lower case (should be `PX-1345`)               | <!--- branch-name fail -->
| `docs/no-ticket/add-linting-section`      | No ticket is in lower case (should be `NO-TICKET`)             | <!--- branch-name fail -->
| `feature/NO-TICKET/allow-delete-bids`     | `feature` changes require a ticket                        | <!--- branch-name fail -->

## Testing

```bash
bundle exec rspec
```

## Linting

```bash
bundle exec rubocop
```

## Development

You can change the linting configuration that this gem provides in the [config/]
folder. This will be inherited by projects using this gem. Note that `rubocop.yml`
only affects this gem, and it won't affect projects using this gem.

### Testing it locally

In your application, use the `path` attribute to point to your local copy of the gem

```ruby
  # Use the relative path from your application, to the cobalt-rubocop folder
  gem 'cobalt-rubocop', path: '../cobalt-rubocop', require: false
```

Alternatively:

- `rake build`
- `gem install pkg/cobalt-rubocop-<version_number>.gem`

### Custom Cops

It is possible to add custom cops to rubocop. One example is `InsecureHashAlgorithm`. See [Ruby Docs] for built in hash functions.

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


## Adding dependencies

Project dependencies should be available under a license in accordance
with Cobalt's OSS license policy.

## Publish (internal)

> Note: Publishing a new version of this gem is only meant for maintainers.

- Ensure you have access to publish on [rubygems].
- Update [CHANGELOG]
- Update [`VERSION`].
- `rake release`
  - This command builds the gem, creates a tag and publishes to rubygems, see [bundler docs].

<!-- Links -->

[CHANGELOG]: ./CHANGELOG.md
[GitHub Workflows]: ./.github/workflows
[Ruby docs]: https://ruby-doc.org/stdlib-2.7.2/libdoc/openssl/rdoc/OpenSSL/Digest.html
[`VERSION`]: ./lib/rubocop/cobalt/version.rb
[bundler docs]: https://bundler.io/guides/creating_gem.html#releasing-the-gem
[rubygems]: https://rubygems.org/gems/cobalt-rubocop
[config/]: ./config
