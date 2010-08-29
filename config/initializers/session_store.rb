# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_time_travel_session',
  :secret      => '25c10002dcebcc7dc8eb783d54a503d1f0f10ae08ee0335a69534529e1cbff32df91a43846abe92bf46da1297fa34b2fde3ffe7155b10a517442e5d8f8da3d01'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
