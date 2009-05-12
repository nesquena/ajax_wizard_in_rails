# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ajax_wizard_rails_session',
  :secret      => 'd5b76741da4e927c2cfe9790710c7e4f7b12dbf691870f612167bf6e778ce7772ece7aa13a9c772d7b27c0c4461f6795d68204d406aef74d9654e4e7b495b043'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
