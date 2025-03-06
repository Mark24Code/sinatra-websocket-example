#!/usr/bin/env ruby

require 'rack/handler/puma'
require_relative 'app'


Rack::Handler::Puma.run(App, Port: 4567)
