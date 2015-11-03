Sim4
====

A game of simulating missionary.

[![wercker status](https://app.wercker.com/status/418cc1b21870d59b3fcb82b109f3fa49/m "wercker status")](https://app.wercker.com/project/bykey/418cc1b21870d59b3fcb82b109f3fa49)

This application is JAPANESE ONLY. 

## Requirement
* Ruby 2.2.3
* SQLite3

On UNIX environment is recommended. (ex. Mac OS X or Debian, openSUSE)

## Install

```bash
git clone https://github.com/sharpgames/sim4.git
cd sim4
bundle install
rake db:migrate
rake db:seed_fu
rails server
```

Access to http://0.0.0.0:3000/ and sign in.

## Contribution
1. Fork it ( http://github.com/sharpgames/sim4/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Author

[sharpgames](https://github.com/sharpgames)

