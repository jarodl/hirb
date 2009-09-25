require 'lib/hirb'
require 'rack/lobster'

use Rack::ShowExceptions
use Hirb::App

run Rack::Lobster.new

