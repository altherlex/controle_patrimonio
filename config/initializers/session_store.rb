# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_controle_patrimonio_session',
  :secret      => 'ad4337c2a5b22e6152e3fc64d2ad9dd4017e81d5eefced228bfadde6551d11122d4aa3b6b0ef3994f78a0a99ea20612b96a6f667cea313e4bba04d904b75c93d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
