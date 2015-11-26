require 'watir-webdriver'
require 'selenium/server'

include Selenium

server = Selenium::Server.new("selenium-server-standalone-2.42.2.jar", :background => true)
server.start

capabilities = WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
#browser = Watir::Browser.new
browser = Watir::Browser.new(:remote, :url => 'http://127.0.0.1:4444/wd/hub', :desired_capabilities => capabilities)
browser = Watir::Browser.new :firefox

browser.goto('http://mono.uniandes.edu.co/users/sign_in')
browser.text_field(:name => "user[email]").set "admin@colgames.com"
browser.text_field(:name => "user[password]").set "12345678"
browser.button(:name => "commit").click
sleep 2
browser.goto('http://mono.uniandes.edu.co/usuarios')

server.stop

