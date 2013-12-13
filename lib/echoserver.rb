#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require "eventmachine"

class EchoServer < EM::Connection
  
  def receive_data(data)
    puts data
  end
  
end

EventMachine.run do
  Signal.trap("INT") { EventMachine.stop }
  Signal.trap("TERM") { EventMachine.stop }
  
  EventMachine.start_server("0.0.0.0", ARGV[0], EchoServer)
end