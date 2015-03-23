# Devise::PhoneConfirmable

[![Code Climate](https://codeclimate.com/github/asiniy/devise-phone_confirmable/badges/gpa.svg)](https://codeclimate.com/github/asiniy/devise-phone_confirmable)

[[Developer guide](CONTRIBUTING.md)]

Sometimes you need user confirm their phone. PhoneConfirmable simplifies process of user's phone confirmation. `Devise::PhoneConfirmable` well-tested and assured working on mri 2.2+ and rails 4.2+. But it should work in the previous versions too.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'devise-phone_confirmable'
```

And then execute:

    $ bundle

## Quickstart

``` ruby
  TODO add generator
```

``` ruby
# app/models/user.rb
devise :database_authenticatable, ...., :phone_confirmable

validates :phone, presence: true, right_format: true # OPTIONAL but highly recommended
```

``` ruby
# app/controllers/application_controller.rb
def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :phone, :password, :password_confirmation) }
```

``` ruby
  #
```

## Contributing

1. Fork it ( https://github.com/asiniy/devise-phone_confirmable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure tests are passed
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
