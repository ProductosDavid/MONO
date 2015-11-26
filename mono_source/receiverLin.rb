#!/usr/bin/env ruby
# encoding: utf-8
require 'rubygems'
require 'mechanize'
require "bunny"

agent = Mechanize.new

conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("recepcion", :durable => true)

ch.prefetch(1)
puts " [*] Waiting for messages. To exit press CTRL+C"

begin
  q.subscribe(:ack => true, :block => true) do |delivery_info, properties, body|
    # imitate some work
    puts " [*] " + body.to_s
    page = agent.get("http://localhost:3000/procesos/"+ body +"/crear_procesooptimi")
    puts " [*] Done " + body.to_s
    sleep 1.0
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
end