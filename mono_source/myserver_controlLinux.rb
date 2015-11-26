require 'rubygems'
require 'daemons'

pwd  = File.dirname(File.expand_path(__FILE__))
file = pwd + '/receiverLin.rb'

Daemons.run_proc(
    'receiverLin', # name of daemon
    :log_output => true
) do
  exec "ruby #{file}"
end