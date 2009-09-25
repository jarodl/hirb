require 'rack'

Hirb::Application = Rack::Static.new(Hirb::App,
  :root => File.join(File.dirname(__FILE__), "..", "..", "public"),
  :urls => "/")

#Hirb::Application = Hirb::App

