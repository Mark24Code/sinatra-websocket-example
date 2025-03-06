# Sinatra WebSocket Example

Ruby 3.4.2

Sinatra + Puma + faye-websocket

This is an example project using Sinatra and Faye::WebSocket.

## Run

clone this repository and do follwings.
```
$ bundle install
$ ruby server.rb
```


## Websocket DSL


```ruby
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

```
