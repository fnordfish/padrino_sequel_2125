# padrino_sequel_2125
Minimal Repo to demonstrate padrino/padrino-framework#2125

Interesting parts are:

1. `config/databse.rb`: causes a LoadError
2. `models/artist.rb`: tries to use the non existing database connecttion (due to 1.)

This makes the project fail with an error like this:

```
$ bin/padrino c
  ERROR -  Sequel::Error - No database associated with Sequel::Model: have you called Sequel.connect or Sequel::Model.db= ?:
 /home/vagrant/.gem/ruby/2.3.1/gems/sequel-4.44.0/lib/sequel/model/base.rb:361:in `db'
/home/vagrant/.gem/ruby/2.3.1/gems/sequel-4.44.0/lib/sequel/model/base.rb:361:in `db': No database associated with Sequel::Model: have you called Sequel.connect or Sequel::Model.db= ? (Sequel::Error)
	from /home/vagrant/.gem/ruby/2.3.1/gems/sequel-4.44.0/lib/sequel/model/base.rb:681:in `inherited'
	from /home/vagrant/padrino_sequel_test/models/artist.rb:1:in `<top (required)>'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/reloader.rb:96:in `require'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/reloader.rb:96:in `block in safe_load'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/reloader.rb:309:in `with_silence'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/reloader.rb:96:in `safe_load'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/loader.rb:155:in `block in require_dependencies'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/loader.rb:153:in `each'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/loader.rb:153:in `require_dependencies'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/loader.rb:58:in `load!'
	from /home/vagrant/padrino_sequel_test/config/boot.rb:60:in `<top (required)>'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/cli/base.rb:31:in `require'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/lib/padrino-core/cli/base.rb:31:in `console'
	from /home/vagrant/.gem/ruby/2.3.1/gems/thor-0.19.4/lib/thor/command.rb:27:in `run'
	from /home/vagrant/.gem/ruby/2.3.1/gems/thor-0.19.4/lib/thor/invocation.rb:126:in `invoke_command'
	from /home/vagrant/.gem/ruby/2.3.1/gems/thor-0.19.4/lib/thor.rb:369:in `dispatch'
	from /home/vagrant/.gem/ruby/2.3.1/gems/thor-0.19.4/lib/thor/base.rb:444:in `start'
	from /home/vagrant/.gem/ruby/2.3.1/gems/padrino-core-0.13.3.3/bin/padrino:9:in `<top (required)>'
	from bin/padrino:17:in `load'
	from bin/padrino:17:in `<main>'
```

... hiding the real issue (the LoadError)
