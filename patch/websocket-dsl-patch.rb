require 'faye/websocket'

Faye::WebSocket.load_adapter('puma')

module Sinatra
  class Base
    class << self
      def websocket(path, &block)
        get path do
          if Faye::WebSocket.websocket?(request.env)
            ws = Faye::WebSocket.new(request.env)

            yield ws

            ws.rack_response
          end
        end
      end
    end
  end
end
