require File.expand_path('../lib/app', __FILE__)

App.check!

run App.rack_adapter
