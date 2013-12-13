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
  puts "starting event machine server"
  
  EventMachine.start_server("0.0.0.0", ARGV[0], EchoServer)
    
end

puts "event machine stopped..?"