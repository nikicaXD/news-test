#
bundle exec update
bundle exec install

# Compile the assets
bundle exec rake assets:precompile

# Start the server
bundle exec rails server


