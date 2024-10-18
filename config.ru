# This file is used by Rack-based servers to start the application.

require 'rack/canonical_host'
require_relative "config/environment"

use Rack::CanonicalHost, 'www.skliarov.com' if Rails.env.production?

run Rails.application
Rails.application.load_server
