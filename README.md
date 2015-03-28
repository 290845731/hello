# Hello

We want enjoyable Rails authentication

__This gem is in rapid development, currently in Beta__




## Status

[![Build Status](https://travis-ci.org/hello-gem/hello.svg?branch=master)](https://travis-ci.org/hello-gem/hello) [![Code Climate](https://codeclimate.com/github/hello-gem/hello.png)](https://codeclimate.com/github/hello-gem/hello) [![Code Climate](https://codeclimate.com/github/hello-gem/hello/coverage.png)](https://codeclimate.com/github/hello-gem/hello) [![Dependency Status](https://gemnasium.com/hello-gem/hello.svg)](https://gemnasium.com/hello-gem/hello) [![Inline docs](http://inch-ci.org/github/hello-gem/hello.png?branch=master)](http://inch-ci.org/github/hello-gem/hello)






## Install

Add this line to your application's Gemfile:

```ruby
gem 'hello', github: 'hello-gem/hello' # latest from github while this gem is in rapid development
```

And then execute:

```bash
bundle install
bundle exec rails generate hello:install
bundle exec rake db:migrate
bundle exec rails generate hello:controls # optional
bundle exec rails generate hello:views # optional
```

## Customizing - behavior and views

These files are generated when you install this gem.

They are simple to customize, just open them.

    ├── app
    │   ├── authentication
    │   │   ├── deactivation_control.rb
    │   │   ├── forgot_password_control.rb
    │   │   ├── reset_password_control.rb
    │   │   ├── sign_in_control.rb
    │   │   ├── sign_out_control.rb
    │   │   ├── sign_up_control.rb
    │   │   └── user_control.rb
    │   ├── controllers
    │   │   ├── novice_controller.rb
    │   │   └── profile_controller.rb
    │   ├── models
    │   │   ├── credential.rb
    │   │   ├── active_session.rb
    │   │   └── user.rb
    │   └── views
    │       ├── hello
    │       │   └── [...optional...]
    │       ├── layouts
    │       │   └── application.html.erb
    │       ├── novice
    │       │   └── index.html.erb
    │       └── profile
    │           └── profile.html.erb
    ├── config
    │   └── initializers
    │       └── hello.rb
    └── db
        └── migrate
            ├── 1_create_credentials.hello.rb
            ├── 2_create_access_tokens.hello.rb
            └── 3_create_users.hello.rb








## Customizing

```ruby
class Credential < ActiveRecord::Base
  include Hello::CredentialModel

  validates_presence_of :username

end

class SignUpControl < Hello::AbstractControl

  def success
    deliver_welcome_email!

    c.respond_to do |format|
      format.html { c.redirect_to root_path }
      format.json { c.render json: access_token, status: :created }
    end
  end

  def failure
    c.respond_to do |format|
      format.html { c.render :sign_up }
      format.json { c.render json: sign_up.errors, status: :unprocessable_entity }
    end
  end

end
```







## References

* Home page: https://github.com/hello-gem/hello
* API Doc: https://github.com/hello-gem/hello
* Version: https://github.com/hello-gem/hello
* Trello Board: https://trello.com/b/WwNptyVM/hello-gem

## Support

* Bugs/Issues: https://github.com/hello-gem/hello/issues
* Support: http://stackoverflow.com/questions/tagged/hello
* Support/Chat: [![Gitter chat](https://badges.gitter.im/hello-gem/hello.png)](https://gitter.im/hello-gem/hello)

## Requirements and Compatibility

* Ruby 1.9+
* Rails 4.0+

## Demo

Want to see it in action?

* Visit https://bit.ly/hellogem
* Sources at https://github.com/hello-gem/hello_demo







# Thank You

[Tim Lucas](https://github.com/toolmantim), [John Nunemaker](https://github.com/jnunemaker), [Dan Everton](https://github.com/deverton) and [Johan Andersson](https://github.com/rejeep) or their open source gem [user_agent_parser](https://github.com/toolmantim/user_agent_parser). As well as [Tobie Langel](https://github.com/tobie) and everybody involved in [BrowserScope](http://www.browserscope.org/) ([full list](https://code.google.com/p/browserscope/people/list)), as our device and browser detection derives from their open-source work.

[Iain Hecker](https://github.com/iain) for his open source gem [http_accept_language](https://github.com/iain/http_accept_language) that helps us understand browser's favorite locales.

[Brian Landau](https://github.com/brianjlandau) and [Ryan Foster](https://github.com/fosome) for [NavLynx](https://github.com/vigetlabs/nav_lynx) as well as everybody on the [Bootstrap Team](https://github.com/orgs/twbs/people) as we use these open source projects on our generated view code.




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Versioning

__Hello__ uses [Semantic Versioning 2.0.0](http://semver.org)

## Copyright

Copyright 2013-2014 James Pinto – Released under [MIT License](http://www.opensource.org/licenses/MIT)


## Additional

Look for these terms in the source code

"TODO", "KNOWNBUG"

## Known bugs

  1. (Rails 4.0 only) Top Feature Set: Current User Feature Set: Settings Feature: Cancel Account Invalid Scenarios Validation: has_many restrict_with_error Scenario 2: User has dependent grandchildren

## To Do

  1. One translation missing: config/locales/*.yml

  2. Test this method: Hello::Rails::Controller::AccessRestrictionConcern::ClassMethods#restrict_if_role_is

  3. Generate Access Token Feature

