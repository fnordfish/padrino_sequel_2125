# padrino_sequel_2125
Minimal Repo to demonstrate padrino/padrino-framework#2125

Interesting parts are:

1. `config/databse.rb`: causes a LoadError
2. `models/artist.rb`: tries to use the non existing database connecttion (due to 1.)
