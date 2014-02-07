Point::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'smtp.gmail.com',
  user_name:            'noreplypoint@gmail.com',
  password:             'POINTCapstone',
  authentication:       'plain',
  enable_starttls_auto: true  }

  #Omnianut Facebook and Google API codes
  ENV['FACEBOOK_APP_ID'] = '238104856372310'
  ENV['FACEBOOK_SECRET'] = 'a29185261ebf12f1969d9a1d1b299324'

  ENV['GOOGLE_CLIENT_ID'] = '892858372150-ru3kltf92ckjup1fr0bcn2vh7c77kusc.apps.googleusercontent.com'
  ENV['GOOGLE_SECRET'] = '4qKgfUfmvOpmAUFykO1XTFHR'
  
end
