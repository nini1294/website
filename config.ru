# Run this with rackup
# Settings for rackup
#\ -p 80 -o 0.0.0.0

require 'rack/unreloader'

# Initialise the Unloader while passing the subclasses to unload
# every time it detects changes
Unreloader = Rack::Unreloader.new(:subclasses => %w'Roda'){MyNeta}
Unreloader.require './index.rb'

# Pass the favicon.ico location
use Rack::Static, :urls => ['/favicon.ico']

run Unreloader
