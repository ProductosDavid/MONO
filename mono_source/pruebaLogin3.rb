require 'capybara'

post_via_redirect "/users/sign_in", {:user => {:email => "da.hoy", :password => "hola"}}

page = visit('http://localhost:3000/users/sign_in')

page.fill_in('user_email', :with => 'admin@colgames.com')
page.fill_in('user_password', :with => '12345678')

page2 = page.click_button('Login')

pp page2