require 'sinatra'
require 'faye/websocket'
require_relative "patch/websocket-dsl-patch"


class App < Sinatra::Base

  get "/" do
    erb :index
  end

  websocket "/ws" do |connect|
    connect.on(:open) do |event|
      puts 'On Open'
    end

    connect.on(:message) do |msg|
      connect.send(msg.data.reverse)  # Reverse and reply
    end

    connect.on(:close) do |event|
      puts 'On Close'
    end
  end
end
