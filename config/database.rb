require "non-exting" # This causes a LoadError, which will not immediately bubble up
raise "I'm no longer raising because of ^^^^"

Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("postgres://localhost/padrino_sequel_test_development", :loggers => [logger], password: "postgres", user: "postgres")
  when :production  then Sequel.connect("postgres://localhost/padrino_sequel_test_production",  :loggers => [logger], password: "postgres", user: "postgres")
  when :test        then Sequel.connect("postgres://localhost/padrino_sequel_test_test",        :loggers => [logger], password: "postgres", user: "postgres")
end
