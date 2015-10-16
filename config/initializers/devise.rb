# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'

  # config.authentication_keys = [:email]
  # config.request_keys = []

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true

  config.skip_session_storage = [:http_auth]

  # config.clean_up_csrf_token_on_authentication = true

  config.stretches = Rails.env.test? ? 1 : 10

  # config.pepper = '40c74fcc459042e1ee967522190e2f9674b59da85b9ac1c9051a29ad832b06a15db0bc52f7592b935102b500e9ab47f262a61e03784e12ff337b9f6cb5a2d7e6'
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days

  config.reconfirmable = true

  # config.confirmation_keys = [:email]
  # config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # config.extend_remember_period = false
  # config.rememberable_options = {}

  config.password_length = 8..72

  # config.email_regexp = /\A[^@]+@[^@]+\z/
  # config.timeout_in = 30.minutes
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true
  # config.reset_password_keys = [:email]

  config.reset_password_within = 6.hours

  # config.sign_in_after_reset_password = true
  # config.encryptor = :sha512
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true
  # config.navigational_formats = ['*/*', :html]

  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], scope: "email"
  
  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
