Sim4
====

A game of simulating missionary.

[![wercker status](https://app.wercker.com/status/418cc1b21870d59b3fcb82b109f3fa49/m "wercker status")](https://app.wercker.com/project/bykey/418cc1b21870d59b3fcb82b109f3fa49)

[![Dependency Status](https://gemnasium.com/sharpgames/sim4.svg)](https://gemnasium.com/sharpgames/sim4)

This application is JAPANESE ONLY. 

## Requirement
* Ruby 2.2.4
* SQLite3(development) / PostgreSQL(production)

UNIX environment is recommended. (ex. Mac OS X or Debian, openSUSE)

## Main Dependent Library
* rails 4.2.5 : Web Framework
* activeadmin : An administrartion framework
* bootstrap-sass : Apply bootstrap theme
* devise : Authentication logic
* seed-fu : Seed data constructuring

## Install

```bash
git clone https://github.com/sharpgames/sim4.git
cd sim4
bundle install --without production
rake db:migrate
rake db:seed_fu
rails server
```

Access to http://0.0.0.0:3000/ and sign in.

(You can use puma instea of rails server, then you should access to http://0.0.0.0:9292/ in default.)

## Usage

Please access to /readme .

## Contribution
1. Fork it ( http://github.com/sharpgames/sim4/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Author

[sharpgames](https://github.com/sharpgames)

