require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get("http://localhost:3000/procesos/18/crear_procesooptimi")

#page = agent.get("http://localhost:3000/users/sign_in")
#form = page.forms.first
#form["user_email"] = "admin@colgames.com"
#form["user_password"] = "12345678"
#form.submit

#sleep 2

#agent.get("http://localhost:3000/procesos/18/crear_procesooptimi")

#page2 = agent.get("http://localhost:3000/procesos/18/crear_procesooptimi")
#page2 = agent.get("http://localhost:3000/usuarios")
#p page2
