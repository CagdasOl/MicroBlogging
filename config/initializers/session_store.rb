# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MicroBlogging_session',
  :secret      => 'af8c9cf4cc47b492e5b33438d44f1c88e5a997aa60c7fcfdf5bbe32f469728d1bff880ae0a51a63890f71f9516d9d5855eb755ab9e415e341daab009e4a5b5be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
