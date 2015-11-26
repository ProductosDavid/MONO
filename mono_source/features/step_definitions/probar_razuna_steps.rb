=begin
    MONO
    Copyright (C) 2015  Universidad de los Andes
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end
# language: es
# =  Ver tareas asignadas

####################################################################################################
# TODO:
####################################################################################################

# Ver tareas de un usuario
Dado /^que soy el usuario (.*)$/ do |nombre|
#pending
end

Cuando /^visito la pagina (.*)$/ do |pagina|
  url = pagina


  payload = {
"method" => "getfolder",
"api_key" => "8F852FE7C05B44528D696CA9A08125AA",
"folderid" => "067A56D20F264918AA66D729C46652D8"
      }.to_json
 
#url = pagina + '?#{payload}'
url = pagina
#    uri = URI.parse(URI::escape(url))
#    http = Net::HTTP.new(uri.host,uri.port)
#    headers={'content-type'=>'applications/json'}
#    @response, @body = http.get_response(uri.request_uri)
uri = URI(pagina)
@response = Net::HTTP.get_response(uri)

end

Entonces /^se espera una respuesta/ do
	p @response #will return httpok status
	p @response.body
  	#p JSON.parse(@body) #will return a hash table which you can parse
end
