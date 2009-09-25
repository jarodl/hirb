require 'lib/hirb'

use Rack::ShowExceptions

run Hirb::Application

