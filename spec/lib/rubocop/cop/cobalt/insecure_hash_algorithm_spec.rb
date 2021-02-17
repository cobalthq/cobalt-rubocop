# frozen_string_literal: true

# converted from https://github.com/github/rubocop-github/blob/master/test/test_insecure_hash_algorithm.rb

RSpec.describe RuboCop::Cop::Cobalt::InsecureHashAlgorithm, :config do
  context 'when benign apis' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def hexencode_the_string_md5
            Digest.hexencode('anything')
          end
          def bubblebabble_the_string_md5
            Digest.bubblebabble('anything')
          end
        end
      RUBY
    end
  end

  context 'when indirect openssl hmac sh256' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          HASH = OpenSSL::Digest::SHA256
          attr :secret
          def secret_hmac
            OpenSSL::HMAC.new(self.secret, HASH)
          end
        end
      RUBY
    end
  end

  context 'when openssl sh1' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          attr :secret
          def secret_hmac
            OpenSSL::HMAC.new(self.secret, 'sha1')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when digest method md5 string' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def h
            Digest('md5')
            ^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when digest method md5 symbol' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def h
            Digest(:MD5)
            ^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when digest method sha256 string' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def h
            Digest('sha256')
          end
        end
      RUBY
    end
  end

  context 'when digest method sha256 symbol' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def h
            Digest(:SHA256)
          end
        end
      RUBY
    end
  end

  context 'when digest md5' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          HASH = Digest::MD5
                 ^^^^^^^^^^^ #{described_class.new.default_message}
        end
      RUBY
    end
  end

  context 'when openssl digest md5' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          HASH = OpenSSL::Digest::MD5
                 ^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
        end
      RUBY
    end
  end

  context 'when digest sha1' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          HASH = Digest::SHA1
                 ^^^^^^^^^^^^ #{described_class.new.default_message}
        end
      RUBY
    end
  end

  context 'when openssl digest sha1' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          HASH = OpenSSL::Digest::SHA1
                 ^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
        end
      RUBY
    end
  end

  context 'when digest sha256' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          HASH = Digest::SHA256
        end
      RUBY
    end
  end

  context 'when openssl digest sha256' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          HASH = OpenSSL::Digest::SHA256
        end
      RUBY
    end
  end

  context 'when hexdigest on random class' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def something(str)
            HASH.hexdigest(str)
          end
        end
      RUBY
    end
  end

  context 'when md5 hexdigest' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def something(str)
            Digest::MD5.hexdigest(str)
            ^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl md5 hexdigest' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def something(str)
            OpenSSL::Digest::MD5.hexdigest(str)
            ^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl md5 digest by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def something(str)
            OpenSSL::Digest.digest('MD5', str)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha1 digest by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def something(str)
            OpenSSL::Digest.digest('SHA1', str)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha1 digest by name mixed case' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def something(str)
            OpenSSL::Digest.digest('Sha1', str)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha256 disgest by name' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar(str)
            OpenSSL::Digest.digest('SHA256', str)
          end
        end
      RUBY
    end
  end

  context 'when openssl md5 hmac by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar(str)
            OpenSSL::HMAC.hexdigest('md5', str)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha1 hmac by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar(str)
            OpenSSL::HMAC.hexdigest('sha1', str)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha256 hmac by name' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar(str)
            OpenSSL::HMAC.hexdigest('sha256', str)
          end
        end
      RUBY
    end
  end

  context 'when openssl md5 digest instance by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar
            OpenSSL::Digest::Digest.new('md5')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha1 digest instance by name' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar
            OpenSSL::Digest::Digest.new('sha1')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{described_class.new.default_message}
          end
        end
      RUBY
    end
  end

  context 'when openssl sha256 digest instance by name' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar
            OpenSSL::Digest::Digest.new('sha256')
          end
        end
      RUBY
    end
  end

  context 'when uuid from hash' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar
            Digest::UUID.uuid_from_hash(Digest::SHA256, 'abc', 'def')
          end
        end
      RUBY
    end
  end

  context 'when uuid_v3' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar
            Digest::UUID.uuid_v3('anything', 'anything')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ uuid_v3 uses MD5, which is not allowed. Prefer: sha256, sha384, sha512
          end
        end
      RUBY
    end
  end

  context 'when uuid_v3 with md5 allowed' do
    let(:cop_config) { {'Allowed' => %w[MD5]} }

    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar
            Digest::UUID.uuid_v3('anything', 'anything')
          end
        end
      RUBY
    end
  end

  context 'when uuid_v4' do
    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          def bar
            Digest::UUID.uuid_v4
          end
        end
      RUBY
    end
  end

  context 'when uuid_v5' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          def bar
            Digest::UUID.uuid_v5('anything', 'anything')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ uuid_v5 uses SHA1, which is not allowed. Prefer: sha256, sha384, sha512
          end
        end
      RUBY
    end
  end

  context 'when only sha512 allowed' do
    let(:cop_config) { {'Allowed' => %w[SHA512]} }

    it 'registers an offense' do
      expect_offense(<<~RUBY)
        class Foo
          HASH = Digest::SHA256
                 ^^^^^^^^^^^^^^ This hash function is not allowed. Prefer: sha512
        end
      RUBY
    end
  end

  context 'when multiple hashes allowed' do
    let(:cop_config) { {'Allowed' => %w[SHA1 SHA256 SHA384 SHA512]} }

    it 'does not register an offense' do
      expect_no_offenses(<<~RUBY)
        class Foo
          HASH = Digest::SHA1
        end
      RUBY
    end
  end
end
