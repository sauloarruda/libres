# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_libres-jairton_session',
  :secret      => '3df05e4ba5e4ddd0ee5bd65bfd119fa5d222a0dea46f52ba3bfa41010b5b24c2ab801d819c370c94e4a59d606d24de49551e4d207f4fddf565616a3f1190f718'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
