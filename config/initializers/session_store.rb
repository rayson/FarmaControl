# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lipsteste_session',
  :secret      => 'f154b6bfb3759faf6eb96f596fe0a76ab6ed09713b4b049eed59c786084ec0782fea2ebd80331dd117b1686f89cca57177a166b883afc1193b0dcf2921ed5955'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
