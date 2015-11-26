#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("recepcion", :durable => true)

msg  = "18"

q.publish(msg.to_s, :persistent => true)

sleep 1.0
conn.close