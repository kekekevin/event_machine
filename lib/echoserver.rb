#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require "date"
require "eventmachine"

$stdout.sync = true

class EchoServer < EM::Connection
  
  def receive_data(data)
    puts data
  end
  
end

EventMachine.run do
  port = ARGV[0] || 8111
  puts "starting event machine server on #{port}"
  
  EventMachine.start_server("0.0.0.0", port, EchoServer)
    
end
